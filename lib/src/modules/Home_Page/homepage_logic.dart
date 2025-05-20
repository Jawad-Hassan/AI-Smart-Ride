import 'package:get/get.dart';

class HomePageController extends GetxController {
  var selectedIndex = 0.obs;
  var username = 'John Doe'.obs; // Example username

  void onNavTapped(int index) {
    selectedIndex.value = index;
  }

  void toggleDriverMode() {
    // Add your logic for driver mode toggle here
    print('Driver Mode toggled!');
  }
}
