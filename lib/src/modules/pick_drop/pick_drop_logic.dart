import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PickDropController extends GetxController {
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController dropoffController = TextEditingController();
  final TextEditingController fareController = TextEditingController();

  bool autoAccept = false;

  void toggleAutoAccept(bool value) {
    autoAccept = value;
    update();
  }

  void handleSearch() {
    // Implement your search logic here
    final pickup = pickupController.text;
    final dropoff = dropoffController.text;
    final fare = fareController.text;

    print("Pickup: $pickup, Dropoff: $dropoff, Fare: $fare, AutoAccept: $autoAccept");
  }

  @override
  void onClose() {
    pickupController.dispose();
    dropoffController.dispose();
    fareController.dispose();
    super.onClose();
  }
}
