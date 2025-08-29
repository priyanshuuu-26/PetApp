import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_app/routes/app_pages.dart';
import 'home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Pets'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: controller.logout,
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.pets.isEmpty) {
          return Center(child: Text('No pets found. Add one!'));
        }
        return ListView.builder(
          itemCount: controller.pets.length,
          itemBuilder: (context, index) {
            final pet = controller.pets[index];
            return ListTile(
              title: Text(pet.name),
              subtitle: Text(pet.type),
              trailing: Text('${pet.age} years old'),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Get.toNamed(Routes.ADD_PET);
          if (result == true) {
            controller.fetchPets();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}