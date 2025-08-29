import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_app/routes/app_pages.dart';
import '../../../data/providers/api_provider.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final apiProvider = Get.find<ApiProvider>();
  final box = GetStorage();
  var isLoading = false.obs;

  void login() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      final response = await apiProvider.login(
        emailController.text,
        passwordController.text,
      );
      isLoading.value = false;

      if (response.statusCode == 200) {
        box.write('token', response.body['access_token']);
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar('Error', response.statusText ?? 'Login failed',
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  @override
  void onInit() {
    Get.put(ApiProvider()); 
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}