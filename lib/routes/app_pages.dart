import 'package:get/get.dart';
import 'package:pet_app/modules/add_pet/pet_binding.dart';
import 'package:pet_app/modules/add_pet/pet_screen.dart';
import '../modules/auth/login/login_binding.dart';
import '../modules/auth/login/login_screen.dart';
import '../modules/auth/register/register_binding.dart';
import '../modules/auth/register/register_screen.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.ADD_PET,
      page: () => AddPetScreen(),
      binding: AddPetBinding(),
    ),
  ];
}