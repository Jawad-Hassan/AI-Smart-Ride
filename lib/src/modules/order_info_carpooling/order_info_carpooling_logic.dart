import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_application_1/src/modules/home_page/homepage_view.dart';

class DriverTrackingCarpoolingController extends GetxController {
  var isLoading = true.obs;
  var driverLocation = LatLng(24.8630, 67.0300).obs;
  var eta = "5 mins".obs;

  @override
  void onInit() {
    super.onInit();
    fetchDriverData();
  }

  void fetchDriverData() async {
    await Future.delayed(Duration(seconds: 1)); // simulate API call
    isLoading.value = false;
  }

  void cancelRide() {
    Get.snackbar("Ride Cancelled", "Your ride has been cancelled.");
    Get.offAll(() => const HomePageView());
  }

  void messageDriver() {
    Get.snackbar("Message", "Message sent to the driver.");
  }

  void callDriver() {
    Get.snackbar("Call", "Calling the driver...");
  }
}
