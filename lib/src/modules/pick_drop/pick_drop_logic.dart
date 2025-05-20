import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/choose_ride/choose_ride_view.dart';
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
  final pickup = pickupController.text;
  final dropoff = dropoffController.text;
  final fare = fareController.text;

  print("Pickup: $pickup, Dropoff: $dropoff, Fare: $fare, AutoAccept: $autoAccept");

  Get.to(() => ChooseRideView(fare: "Rs. $fare"));
  if (fare.isEmpty) {
  Get.snackbar("Error", "Please enter a fare amount.");
  return;
}

}


  @override
  void onClose() {
    pickupController.dispose();
    dropoffController.dispose();
    fareController.dispose();
    super.onClose();
  }
}
