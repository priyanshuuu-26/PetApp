import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends GetxService {
  final String _baseUrl = "http://10.0.2.2:8000";
  final GetStorage _box = GetStorage();

  Future<Response> _handleRequest(Future<http.Response> Function() request) async {
    try {
      final http.Response response = await request();
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Response(body: json.decode(response.body), statusCode: response.statusCode);
      } else {
        return Response(
          statusCode: response.statusCode,
          statusText: json.decode(response.body)['detail'] ?? 'An error occurred',
        );
      }
    } catch (e) {
      return Response(statusCode: 500, statusText: 'Connection error: ${e.toString()}');
    }
  }

  //Auth
  Future<Response> register(String email, String password) => _handleRequest(
    () => http.post(
      Uri.parse('$_baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    ),
  );

  Future<Response> login(String email, String password) => _handleRequest(
    () => http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    ),
  );

  //Pets
  Map<String, String> get _authHeaders {
    final token = _box.read('token');
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<Response> getPets() => _handleRequest(
    () => http.get(Uri.parse('$_baseUrl/pets'), headers: _authHeaders),
  );

  Future<Response> addPet(String name, String type, int age, String notes) => _handleRequest(
    () => http.post(
      Uri.parse('$_baseUrl/pets'),
      headers: _authHeaders,
      body: json.encode({'name': name, 'type': type, 'age': age, 'notes': notes}),
    ),
  );
}