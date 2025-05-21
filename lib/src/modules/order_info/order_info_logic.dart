import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class DriverTrackingController extends GetxController {
  var isLoading = true.obs;
  var driverInfo = {}.obs;
  var driverLocation = LatLng(24.8630, 67.0300).obs;
  var eta = "5 mins".obs;

  @override
  void onInit() {
    super.onInit();
    fetchDriverData();
  }

  void fetchDriverData() async {
    await Future.delayed(Duration(seconds: 1)); // simulate API call
    driverInfo.value = {
      "name": "Ali Khan",
      "car": "Suzuki Alto - White",
      "rating": 4.8,
      "phone": "+92 300 1234567"
    };
    isLoading.value = false;
  }

  void cancelRide() {
    Get.snackbar("Ride Cancelled", "Your ride has been cancelled.");
    Get.offAllNamed('/home'); // or use Get.to(() => HomePageView());
  }

  void messageDriver() {
    Get.snackbar("Message", "Message sent to the driver.");
  }

  void callDriver() {
    Get.snackbar("Call", "Calling the driver...");
  }
}
