import 'package:get/get.dart';

class Ride {
  final String name;
  final String distance;
  final String route;
  final String fare;

  Ride({
    required this.name,
    required this.distance,
    required this.route,
    required this.fare,
  });
}

class DriverHomeLogic extends GetxController {
  var rideList = <Ride>[].obs;

  @override
  void onInit() {
    super.onInit();
    rideList.addAll([
      Ride(
          name: 'Asad',
          distance: '1.5',
          route: 'Gulberg to DHA',
          fare: '500'),
      Ride(
          name: 'Ali',
          distance: '1.5',
          route: 'Gulberg to township',
          fare: '300'),

    ]);
  }
}