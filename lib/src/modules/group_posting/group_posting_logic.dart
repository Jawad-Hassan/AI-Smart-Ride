// group_posting_logic.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/modules/chat_page/chat_page_logic.dart';
import 'package:get/get.dart';

class GroupPostingLogic extends GetxController {
  final groupNameController = TextEditingController();
  final dateTimeController = TextEditingController();
  final detailsController = TextEditingController();

  // Store posted groups
  var postedGroups = <Map<String, String>>[].obs;


void postGroup() {
  final name = groupNameController.text;
  final time = dateTimeController.text;
  final details = detailsController.text;

  if (name.isNotEmpty && time.isNotEmpty && details.isNotEmpty) {
    final newGroup = {
      'name': name,
      'time': time,
      'details': details,
    };

    postedGroups.add(newGroup);

    Get.snackbar("Group Created", "Name: $name\nTime: $time\nDetails: $details");

    groupNameController.clear();
    dateTimeController.clear();
    detailsController.clear();

    // 👇 Go back and change the tab to GroupChatScreen
    final chatLogic = Get.find<ChatPageLogic>();
    chatLogic.currentIndex = 2;

    // Close the current screen (GroupPostingView)
    Get.back();
  } else {
    Get.snackbar("Error", "All fields are required.");
  }
}




  @override
  void onClose() {
    groupNameController.dispose();
    dateTimeController.dispose();
    detailsController.dispose();
    super.onClose();
  }
}

