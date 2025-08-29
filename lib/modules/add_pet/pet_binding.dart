import 'package:get/get.dart';
import 'package:pet_app/modules/add_pet/pet_controller.dart';

class AddPetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPetController>(() => AddPetController());
  }
}