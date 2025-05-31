import 'package:flutter_application_1/src/modules/Welcome_Page.dart';
import 'package:get/get.dart';


class SettingsController extends GetxController {
  void deleteAccount() {
    // Show feedback
    // Get.snackbar('Delete Account', 'Account deletion logic triggered.',
    //     snackPosition: SnackPosition.BOTTOM);
    
    // Navigate to WelcomePage and remove all routes
    Future.delayed(const Duration(milliseconds: 800), () {
      Get.offAll(() => WelcomePage());
    });
  }

  void logout() {
    // Get.snackbar('Log Out', 'Logout logic triggered.',
    //     snackPosition: SnackPosition.BOTTOM);

    Future.delayed(const Duration(milliseconds: 800), () {
      Get.offAll(() => WelcomePage());
    });
  }
}
