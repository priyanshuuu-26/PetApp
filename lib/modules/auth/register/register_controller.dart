import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_app/routes/app_pages.dart';
import '../../../data/providers/api_provider.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final apiProvider = Get.find<ApiProvider>();
  var isLoading = false.obs;

  void register() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      final response = await apiProvider.register(
        emailController.text,
        passwordController.text,
      );
      isLoading.value = false;

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Registration successful! Please log in.',
            snackPosition: SnackPosition.BOTTOM);
        Get.offNamed(Routes.LOGIN);
      } else {
        Get.snackbar('Error', response.statusText ?? 'Registration failed',
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