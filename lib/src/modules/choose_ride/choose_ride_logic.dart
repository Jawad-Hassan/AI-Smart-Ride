import 'package:flutter_application_1/src/modules/driver_ETA/driver_ETA_view.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class ChooseRideController extends GetxController {
  var isLoading = true.obs;
  var rideOffers = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMockOffers();
  }

  void fetchMockOffers() async {
    isLoading.value = true;

    await Future.delayed(Duration(seconds: 2)); // Simulate delay

    rideOffers.value = [
  {
    'name': 'Ali Khan',
    'rating': 4.8,
    'car': 'Suzuki Alto - White',
    'price': 200,
    'location': LatLng(24.8607, 67.0011), // example coords for Karachi
  },
  {
    'name': 'Sara Ahmed',
    'rating': 4.9,
    'car': 'Toyota Corolla - Silver',
    'price': 250,
    'location': LatLng(24.8610, 67.0020),
  },
  {
    'name': 'John Doe',
    'rating': 4.7,
    'car': 'Honda Civic - Black',
    'price': 220,
    'location': LatLng(24.8595, 67.0030),
  },
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
  Get.to(() => DriverETAView(
    driverInfo: offer,
    driverLocation: offer['location'], // Make sure this exists
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
