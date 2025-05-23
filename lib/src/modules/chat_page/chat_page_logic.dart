import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/Home_Page/homepage_view.dart';
import 'package:flutter_application_1/src/modules/History_screen/history_view.dart';

class ChatPageLogic extends GetxController {
  var currentIndex = 2;

  var joinedGroups = <String>[].obs;
  var groupMembers = <String, int>{}.obs;

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

  void joinGroup(String groupName) {
    if (!joinedGroups.contains(groupName)) {
      joinedGroups.add(groupName);
      groupMembers[groupName] = (groupMembers[groupName] ?? 0) + 1;
    }
  }

  int getMemberCount(String groupName) {
    return groupMembers[groupName] ?? 1; // default 1 for group creator
  }
}

