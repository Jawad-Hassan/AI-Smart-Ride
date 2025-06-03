import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverSignUpController extends GetxController {
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  void onSignUpPressed(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Get.toNamed('/driver-signup-verification');
    }
  }

  void goBack() {
    Get.back();
  }
}
