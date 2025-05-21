import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/choose_ride/choose_ride_view.dart';
import 'package:latlong2/latlong.dart';

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

    if (pickup.isEmpty || dropoff.isEmpty || fare.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields.");
      return;
    }

    final pickupLocation = LatLng(24.8607, 67.0011);
    final dropoffLocation = LatLng(24.8937, 67.0281);

    print("Pickup: $pickup, Dropoff: $dropoff, Fare: $fare, AutoAccept: $autoAccept");

    Get.to(() => ChooseRideView(
          pickupLocation: pickupLocation,
          dropoffLocation: dropoffLocation,
          pickupAddress: pickup,
          dropoffAddress: dropoff,
          fare: "Rs. $fare",
        ));
  }

  // Remove @override here if you get error, and just define the method
  void onClose() {
    pickupController.dispose();
    dropoffController.dispose();
    fareController.dispose();
    super.onClose();
  }
}
