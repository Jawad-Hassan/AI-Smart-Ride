import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_application_1/src/modules/home_page/homepage_view.dart';

class DriverTrackingCarpoolingController extends GetxController {
  // Observables
  final isLoading = true.obs;
  final driverLocation = LatLng(24.8630, 67.0300).obs;
  final eta = "5 mins".obs;

  @override
  void onInit() {
    super.onInit();
    _loadDriverInfo();
  }

  // Simulates fetching driver data from an API
  Future<void> _loadDriverInfo() async {
    try {
      await Future.delayed(const Duration(seconds: 1)); // Mock API delay
      // Example update: simulate new driver location and ETA
      driverLocation.value = LatLng(24.8640, 67.0310);
      eta.value = "4 mins";
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch driver data.");
    } finally {
      isLoading.value = false;
    }
  }

  // Cancel the ride and navigate to home
  void cancelRide() {
    Get.snackbar("Ride Cancelled", "Your ride has been cancelled.");
    Get.offAll(() => const HomePageView());
  }

  // Send a message to the driver
  void messageDriver() {
    // Add your messaging logic here
    Get.snackbar("Message Sent", "You have messaged the driver.");
  }

  // Call the driver
  void callDriver() {
    // Add call integration logic if needed
    Get.snackbar("Calling Driver", "Initiating call...");
  }
}
