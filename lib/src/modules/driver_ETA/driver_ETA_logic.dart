import 'dart:async';
import 'package:flutter_application_1/src/modules/message_driver_screen/message_driver_view.dart';
import 'package:flutter_application_1/src/modules/share_ride/share_ride_view.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../driver_arrived/driver_arrived_view.dart';


class DriverETAController extends GetxController {
  final Map<String, dynamic> driverInfo;
  final LatLng driverLocation;
  final LatLng pickupLocation;
  final LatLng dropoffLocation;
  final String pickupAddress;
  final String dropoffAddress;

  var secondsLeft = 10.obs;
  Timer? _timer;

  DriverETAController({
    required this.driverInfo,
    required this.driverLocation,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.pickupAddress,
    required this.dropoffAddress,
  });

  @override
  void onInit() {
    super.onInit();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (secondsLeft.value == 0) {
        timer.cancel();
        _navigateToDriverArrived();
      } else {
        secondsLeft.value--;
      }
    });
  }

  void _navigateToDriverArrived() {
    Get.off(() => DriverArrivedView(
          driverInfo: driverInfo,
          pickupLocation: pickupLocation,
          dropoffLocation: dropoffLocation,
          pickupAddress: pickupAddress,
          dropoffAddress: dropoffAddress,
        ));
  }

  void messageDriver() {
    Get.to(() => DriverChattingScreenView(
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

  void callDriver() {
    // Simulated behavior. You can use url_launcher later to actually dial.
    Get.snackbar("Calling", "Calling ${driverInfo['name']}...");
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
