import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/accept_ride/accept_ride_view.dart';
import 'package:flutter_application_1/src/modules/driver_homepage/driver_home_logic.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

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
  final offeredPrice = priceController.text.trim();
  if (offeredPrice.isEmpty) {
    Get.snackbar("Error", "Please enter a price");
    return;
  }

  Get.to(() => UserInformationView(), arguments: {
    'driverLocation': LatLng(31.5204, 74.3587),
    'passengerLocation': LatLng(31.4504, 74.4094),
    'pickup': 'Gulberg',
    'dropoff': 'Township',
    'riderName': 'Asad',
    'eta': 'Approx 20 minutes',
    'riderImage': 'assets/images/user.png',
    'offeredPrice': offeredPrice,
  });
}


  @override
  void onClose() {
    priceController.dispose();
    super.onClose();
  }

}
