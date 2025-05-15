import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
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
      Get.toNamed('/verification'); // Assuming you have route named '/verification'
    }
  }

  void goToSignUp() {
    Get.toNamed('/signup'); // Assuming you have route named '/signup'
  }
}
