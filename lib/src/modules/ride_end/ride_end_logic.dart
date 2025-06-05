import 'package:flutter_application_1/src/modules/driver_homepage/driver_home_view.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class RideEndLogic extends GetxController {
  late final LatLng yourLocation;
  late final LatLng destinationLocation;
  late final String pickup;
  late final String dropoff;
  late final String riderName;
  late final String eta;
  late final String riderImage;
  late final String offeredPrice;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;

    yourLocation = args['pickupLocation'];
    destinationLocation = args['dropoffLocation'];
    pickup = args['pickup'];
    dropoff = args['dropoff'];
    riderName = args['riderName'];
    eta = args['eta'];
    riderImage = args['riderImage'];
    offeredPrice = args['offeredPrice'];
  }

 void endRide() {
  // Show confirmation
  Get.snackbar("Ride Completed", "You have successfully ended the ride.");

  // Navigate to the DriverHomePage and clear previous screens
  Future.delayed(Duration(seconds: 1), () {
    Get.offAll(() => DriverHomePageView());
  });
}

}
