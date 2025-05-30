import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/modules/Home_Page/homepage_view.dart';
import 'package:flutter_application_1/src/modules/History_screen/history_view.dart';

class ChatPageLogic extends GetxController {
  var currentIndex = 2;

  var joinedGroups = <Map<String, String>>[].obs;
  var groupMembers = <String, int>{}.obs;

  void onNavTapped(int index, BuildContext context) {
    if (index == currentIndex) return;
    currentIndex = index;
    switch (index) {
      case 0:
        Get.off(() => const HomePageView());
        break;
      case 1:
        Get.off(() => HistoryView());
        break;
    }
  }

  void joinGroup(String groupName, String time, String details) {
    bool alreadyJoined = joinedGroups.any((group) => group['name'] == groupName);
    if (!alreadyJoined) {
      joinedGroups.add({
        'name': groupName,
        'time': time,
        'details': details,
      });
      groupMembers[groupName] = (groupMembers[groupName] ?? 0) + 1;
    }
  }
void leaveGroup(String groupName) {
  joinedGroups.removeWhere((group) => group['name'] == groupName);
  groupMembers.remove(groupName);
}

  int getMemberCount(String groupName) {
    return groupMembers[groupName] ?? 1;
  }
}
