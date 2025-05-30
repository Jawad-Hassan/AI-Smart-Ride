import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverLoginController extends GetxController {
  final phoneController = TextEditingController();

  // Optionally handle form validation, state, etc.
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }

  void onLoginPressed(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Get.toNamed('/driververification'); // Assuming you have route named '/verification'
    }
  }

  void goToSignUp() {
    Get.toNamed('/driversignup'); // Assuming you have route named '/signup'
  }
}
