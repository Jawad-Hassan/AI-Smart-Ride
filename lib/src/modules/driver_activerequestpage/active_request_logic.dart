import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/driver_homepage/driver_home_logic.dart';
import 'package:get/get.dart';


class DriverActiveRequestLogic extends GetxController {
  var activeRide = Rxn<Ride>();
  final priceController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Fetch passed ride from arguments
    final ride = Get.arguments as Ride?;
    if (ride != null) {
      activeRide.value = ride;
    }
  }

  void onNextStepPressed() {
    // Implement logic for next step, e.g., send offer
    print("Offered Price: ${priceController.text}");
  }

  @override
  void onClose() {
    priceController.dispose();
    super.onClose();
  }

}
