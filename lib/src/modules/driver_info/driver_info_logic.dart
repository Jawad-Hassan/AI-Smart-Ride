import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class DriverInfoLogic extends GetxController {
  final Rx<File?> selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();
  final nameController = TextEditingController();
  final RxString errorText = ''.obs;

  Future<void> takeSelfie() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    } else {
      errorText.value = 'Selfie not taken.';
    }
  }

  void deleteSelfie() {
    selectedImage.value = null;
  }

  void onNext() {
    if (selectedImage.value == null) {
      errorText.value = 'Please take a selfie.';
      return;
    }

    if (nameController.text.trim().isEmpty) {
      errorText.value = 'Please enter your name.';
      return;
    }

    errorText.value = '';
    Get.snackbar("Success", "Data submitted successfully.");
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
