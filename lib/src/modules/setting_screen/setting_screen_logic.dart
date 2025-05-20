import 'package:get/get.dart';


class SettingsController extends GetxController {
  void deleteAccount() {
    // TODO: Add real logic here
    Get.snackbar('Delete Account', 'Account deletion logic triggered.',
        snackPosition: SnackPosition.BOTTOM);
  }

  void logout() {
    // TODO: Add real logout logic
    Get.snackbar('Log Out', 'Logout logic triggered.',
        snackPosition: SnackPosition.BOTTOM);
  }
}
