import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/providers/api_provider.dart';

class AddPetController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final typeController = TextEditingController();
  final ageController = TextEditingController();
  final notesController = TextEditingController();
  final apiProvider = Get.find<ApiProvider>();
  var isLoading = false.obs;

  void addPet() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      final response = await apiProvider.addPet(
        nameController.text,
        typeController.text,
        int.parse(ageController.text),
        notesController.text,
      );
      isLoading.value = false;
      if (response.statusCode == 201) {
        Get.back(result: true);
        Get.snackbar('Success', 'Pet added successfully!');
      } else {
        Get.snackbar('Error', response.statusText ?? 'Failed to add pet');
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
    nameController.dispose();
    typeController.dispose();
    ageController.dispose();
    notesController.dispose();
    super.onClose();
  }
}