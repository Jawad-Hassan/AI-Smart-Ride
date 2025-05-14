import 'package:get/get.dart';

class HomePageController extends GetxController {
  var selectedIndex = 0.obs;

  void onNavTapped(int index) {
    selectedIndex.value = index;
  }
}
