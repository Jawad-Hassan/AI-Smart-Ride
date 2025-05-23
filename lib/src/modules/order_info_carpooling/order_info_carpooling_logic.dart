import 'dart:async';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_application_1/src/modules/home_page/homepage_view.dart';
import 'package:flutter_application_1/src/modules/ride_summary/ride_summary_view.dart'; // Update if needed

class DriverTrackingCarpoolingController extends GetxController {
  final isLoading = true.obs;
  final driverLocation = LatLng(24.8630, 67.0300).obs;
  final eta = "5 mins".obs;

  final rideCancelled = false.obs;

  late Timer _endRideTimer;
  late Map<String, dynamic> driverInfo;
  late LatLng pickupLocation;
  late LatLng dropoffLocation;
  late String pickupAddress;
  late String dropoffAddress;

  @override
  void onInit() {
    super.onInit();
    _loadDriverInfo();

    _endRideTimer = Timer(const Duration(seconds: 10), () {
      if (!rideCancelled.value) {
        endRide();
      }
    });
  }

  Future<void> _loadDriverInfo() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      driverLocation.value = LatLng(24.8640, 67.0310);
      eta.value = "4 mins";
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch driver data.");
    } finally {
      isLoading.value = false;
    }
  }

  void cancelRide() {
    rideCancelled.value = true;
    _endRideTimer.cancel();
    Get.snackbar("Ride Cancelled", "Your ride has been cancelled.");
    Get.offAll(() => const HomePageView());
  }

  void messageDriver() {
    Get.snackbar("Message Sent", "You have messaged the driver.");
  }

  void callDriver() {
    Get.snackbar("Calling Driver", "Initiating call...");
  }

  void endRide() {
    if (rideCancelled.value) return;

    Get.to(() => RideSummaryView(
          driverInfo: driverInfo,
          fare: 250,
          pickupLocation: pickupLocation,
          dropoffLocation: dropoffLocation,
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
