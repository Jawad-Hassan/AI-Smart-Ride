import 'package:flutter_application_1/src/modules/ride_end/ride_end_view.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class RideStartLogic extends GetxController {
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

 void startRide() {
  // Notify user
  Get.snackbar("Ride Started", "You have begun the ride.");

  // Navigate to RideEndView with same arguments
  Get.to(() => RideEndView(), arguments: {
    'pickupLocation': yourLocation,         // Driver's location
    'dropoffLocation': destinationLocation, // Passenger's destination
    'pickup': pickup,
    'dropoff': dropoff,
    'riderName': riderName,
    'riderImage': riderImage,
    'offeredPrice': offeredPrice,
    'eta': eta,
  });
}

}
