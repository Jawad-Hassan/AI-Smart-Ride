import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/Home_Page/homepage_view.dart';
import 'package:flutter_application_1/src/modules/History_screen/history_view.dart';

class ChatPageLogic extends GetxController {
  var currentIndex = 2;

  void onNavTapped(int index, BuildContext context) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Get.off(() => const HomePageView());
        break;
      case 1:
        Get.off(() => HistoryView());
        break;
    }
  }
}