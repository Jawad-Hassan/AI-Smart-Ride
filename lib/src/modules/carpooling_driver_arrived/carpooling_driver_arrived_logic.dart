import 'dart:async';
import 'package:flutter_application_1/src/modules/ride_share_carpooling/ride_share_carpooling_view.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../message_driver_screen/message_driver_view.dart';

class CarpoolingDriverArrivedController extends GetxController {
  final Map<String, dynamic> driverInfo;
  final LatLng pickupLocation;
  final LatLng dropoffLocation;
  final String pickupAddress;
  final String dropoffAddress;

  var secondsLeft = 300.obs;
  Timer? _timer;

  CarpoolingDriverArrivedController({
    required this.driverInfo,
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
        Get.snackbar("Timeout", "Your ride may be canceled soon.");
      } else {
        secondsLeft.value--;
      }
    });
  }

  void messageDriver() {
    Get.to(() => DriverChattingScreenView());
  }

  void shareRideDetails() {
    Get.to(() => RideShareCarpoolingView(
          driverInfo: Map<String, dynamic>.from(driverInfo),
          pickupAddress: pickupAddress,
          dropoffAddress: dropoffAddress,
          trackingURL: "https://www.uber.com/track/abcdef123456",
        ));
  }

  void callDriver() {
    Get.snackbar("Calling", "Calling ${driverInfo['name']}...");
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
