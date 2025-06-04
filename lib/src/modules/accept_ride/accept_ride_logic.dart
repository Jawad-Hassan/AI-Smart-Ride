import 'package:flutter_application_1/src/modules/ride_start/ride_start_view.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class UserInformationLogic extends GetxController {
  late final LatLng driverLocation;
  late final LatLng passengerLocation;
  late final String pickup;
  late final String dropoff;
  late final String riderName;
  late final String eta;
  late final String riderImage;
  late final String offeredPrice;
  void goToRideStart() {
    Get.to(() => RideStartView(), arguments: {
      'pickup': pickup,
      'dropoff': dropoff,
      'pickupLocation': driverLocation,
      'dropoffLocation': passengerLocation,
      'riderName': riderName,
      'riderImage': riderImage,
      'offeredPrice': offeredPrice,
      'eta': eta,
    });
  }

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    driverLocation = args['driverLocation'];
    passengerLocation = args['passengerLocation'];
    pickup = args['pickup'];
    dropoff = args['dropoff'];
    riderName = args['riderName'];
    eta = args['eta'];
    riderImage = args['riderImage'];
    offeredPrice = args['offeredPrice'];
  }
}
