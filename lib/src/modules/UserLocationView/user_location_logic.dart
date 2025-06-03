import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class UserLocationLogic extends GetxController {
  var isLoading = true.obs;
  var driverLocation = const LatLng(31.5204, 74.3587).obs; // Example: Lahore

  late LatLng pickupLocation;
  late LatLng dropoffLocation;

  @override
  void onInit() {
    super.onInit();
    // Simulate fetching driver’s real-time location
    Future.delayed(const Duration(seconds: 2), () {
      driverLocation.value = const LatLng(31.5194, 74.3545); // Adjust as needed
      isLoading.value = false;
    });
  }

  void callUser() {
    // Logic to call user (e.g. open dialer)
    print("Calling user...");
  }

  void messageUser() {
    // Logic to message user (e.g. open chat screen)
    print("Messaging user...");
  }

  void markArrived() {
    // Logic when driver arrives at pickup
    print("Driver has arrived");
    // You can use Get.to or trigger API here
  }
}
