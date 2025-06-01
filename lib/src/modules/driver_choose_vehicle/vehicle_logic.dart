import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/driver_homepage/driver_home_view.dart';

class VehicleSelectionLogic extends GetxController {
  void onCarSelected() {
    // Navigate to DriverHomePageView using GetX navigation
    Get.off(() => DriverHomePageView());
  }

  void onRickshawSelected() {
    Get.off(() => DriverHomePageView());
    // Similarly, add navigation if needed
  }

  void onBikeSelected() {
    Get.off(() => DriverHomePageView());
    // Similarly, add navigation if needed
  }
}
