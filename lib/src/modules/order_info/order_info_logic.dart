import 'dart:async';
import 'package:flutter_application_1/src/modules/message_driver_screen/message_driver_view.dart';
import 'package:flutter_application_1/src/modules/share_ride/share_ride_view.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_application_1/src/modules/ride_summary/ride_summary_view.dart'; // update path as needed

class DriverTrackingController extends GetxController {
  var isLoading = true.obs;
  var driverInfo = {}.obs;
  var driverLocation = LatLng(24.8630, 67.0300).obs;
  var eta = "5 mins".obs;

  var rideCancelled = false.obs; // Track if ride is cancelled
  late LatLng pickupLocation;
  late LatLng dropoffLocation;

  late Timer _endRideTimer; // Timer for ending ride

  @override
  void onInit() {
    super.onInit();
    fetchDriverData();

    // Start a timer to end ride after 10 seconds (for testing)
    _endRideTimer = Timer(Duration(seconds: 10), () {
      if (!rideCancelled.value) {
        endRide();
      }
    });
  }

  void fetchDriverData() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate API call
    driverInfo.value = {
      "name": "Ali Khan",
      "car": "Suzuki Alto - White",
      "rating": 4.8,
      "phone": "+92 300 1234567"
    };
    isLoading.value = false;
  }

  void cancelRide() {
    rideCancelled.value = true; // Mark as cancelled
    _endRideTimer.cancel(); // Cancel the timer
    Get.snackbar("Ride Cancelled", "Your ride has been cancelled.");
    Get.offAllNamed('/home');
  }

  void messageDriver() {

    Get.to(() => DriverChattingScreenView());
  }

  void callDriver() {
    Get.snackbar("Call", "Calling the driver...");
  }

  void endRide() {
    if (rideCancelled.value) return; // Do not proceed if cancelled

    Get.to(() => RideSummaryView(
          driverInfo: Map<String, dynamic>.from(driverInfo.value),
          fare: 250,
          pickupLocation: pickupLocation,
          dropoffLocation: dropoffLocation,
        ));
  }

  void shareRideDetails() {
    Get.to(() => RideShareView(
          driverInfo: Map<String, dynamic>.from(driverInfo),
          pickupAddress: pickupLocation.toString(),
          dropoffAddress: dropoffLocation.toString(),
          trackingURL:
              "https://www.uber.com/track/abcdef123456", // or generate dynamically
        ));
  }

  @override
  void onClose() {
    if (_endRideTimer.isActive) {
      _endRideTimer.cancel();
    }
    super.onClose();
  }
}
