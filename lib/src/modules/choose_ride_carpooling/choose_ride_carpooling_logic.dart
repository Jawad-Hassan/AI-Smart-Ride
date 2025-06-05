
import 'package:flutter_application_1/src/modules/carpooling_driver_ETA/carpooling_driver_ETA_view.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class ChooseRideCarpoolingController extends GetxController {
  var isLoading = true.obs;
  var rideOffers = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMockOffers();
  }

  void fetchMockOffers() async {
    isLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    rideOffers.value = [
      {'name': 'Ali Khan', 'rating': 4.8, 'car': 'Suzuki Alto - White', 'price': 200},
      {'name': 'Sara Ahmed', 'rating': 4.9, 'car': 'Toyota Corolla - Silver', 'price': 250},
      {'name': 'John Doe', 'rating': 4.7, 'car': 'Honda Civic - Black', 'price': 220},
    ];
    isLoading.value = false;
  }

  void acceptRide(
    Map<String, dynamic> offer,
    LatLng pickupLocation,
    LatLng dropoffLocation,
    String pickupAddress,
    String dropoffAddress,
  ) {
    // For demo, driverLocation = some offset from pickupLocation (can be replaced by actual GPS data)
    final driverLocation = LatLng(
      pickupLocation.latitude + 0.001, 
      pickupLocation.longitude + 0.001,
    );

    // Navigate to CarpoolingDriverETAView
    Get.to(() => CarpoolingDriverETAView(
      driverInfo: offer,
      driverLocation: driverLocation,
      pickupLocation: pickupLocation,
      dropoffLocation: dropoffLocation,
      pickupAddress: pickupAddress,
      dropoffAddress: dropoffAddress,
    ));
  }

  void declineRide() {
    Get.snackbar("Ride Declined", "You declined the ride offer.");
  }
}
