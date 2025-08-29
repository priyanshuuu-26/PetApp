import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_app/routes/app_pages.dart';

import 'login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize = screenWidth.clamp(150.0, 300.0) * 0.8;

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/pet.jpg',
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey.shade200,
                        child: Icon(
                          Icons.pets,
                          size: imageSize * 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                TextFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter an email';
                    if (!GetUtils.isEmail(value))
                      return 'Please enter a valid email';
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Please enter a password';
                    return null;
                  },
                ),
                SizedBox(height: 32),
                Obx(
                  () => controller.isLoading.value
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: controller.login,
                          child: Text('Login'),
                        ),
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () => Get.toNamed(Routes.REGISTER),
                  child: Text("Don't have an account? Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
