// /mobile/lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_app/binding.dart';
import 'package:pet_app/colors.dart';
import 'package:pet_app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final token = box.read('token');

    return GetMaterialApp(
      title: 'Pet App',
      theme: ThemeData(
        primarySwatch: Colors.blue, 
        scaffoldBackgroundColor: AppColors.background, 
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary, 
          foregroundColor: AppColors.textLight,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textLight,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      initialRoute: token == null ? Routes.LOGIN : Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}