import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverActiveRequestLogic extends GetxController {
  final TextEditingController priceController = TextEditingController();

  void onNextStepPressed() {
    final price = priceController.text.trim();
    if (price.isEmpty) {
      Get.snackbar("Error", "Please enter your price offer.",
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white);
      return;
    }

    // Simulate processing logic
    print("Offered price: Rs. $price");
    Get.snackbar("Success", "Your offer has been submitted.",
        backgroundColor: Colors.green.withOpacity(0.8),
        colorText: Colors.white);
  }

  @override
  void onClose() {
    priceController.dispose();
    super.onClose();
  }
}
