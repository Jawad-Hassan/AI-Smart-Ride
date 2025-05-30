
import 'package:get/get.dart';

class UserTypeSelectionController extends GetxController {
  void onDriverPressed() {
    Get.toNamed('/driverLogin'); // Replace with your actual route
  }

  void onPassengerPressed() {
    Get.toNamed('/passengerLogin'); // Replace with your actual route
  }
}
