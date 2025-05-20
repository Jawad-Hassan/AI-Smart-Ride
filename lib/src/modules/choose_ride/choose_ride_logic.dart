import 'package:get/get.dart';

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
      },
      {
        'name': 'Sara Ahmed',
        'rating': 4.9,
        'car': 'Toyota Corolla - Silver',
        'price': 250,
      },
      {
        'name': 'John Doe',
        'rating': 4.7,
        'car': 'Honda Civic - Black',
        'price': 220,
      },
    ];

    isLoading.value = false;
  }

  void acceptRide(String driverName) {
    Get.snackbar("Ride Accepted", "You accepted a ride from $driverName");
  }

  void declineRide() {
    Get.snackbar("Ride Declined", "You declined the ride offer.");
  }
}
