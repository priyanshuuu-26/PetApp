import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_app/modules/add_pet/pet_controller.dart';

class AddPetScreen extends GetView<AddPetController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a New Pet')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (v) => v!.isEmpty ? 'Name is required' : null,
              ),
              TextFormField(
                controller: controller.typeController,
                decoration: InputDecoration(labelText: 'Type (e.g., Dog)'),
                validator: (v) => v!.isEmpty ? 'Type is required' : null,
              ),
              TextFormField(
                controller: controller.ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (v) => v!.isEmpty ? 'Age is required' : null,
              ),
              TextFormField(
                controller: controller.notesController,
                decoration: InputDecoration(labelText: 'Notes'),
              ),
              SizedBox(height: 20),
              Obx(() => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: controller.addPet,
                      child: Text('Save Pet'),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}