import 'package:flutter_application_1/src/modules/chat_page/chat_page_logic.dart';
import 'package:get/get.dart';

class ChattingScreenController extends GetxController {
  late final ChatPageLogic chatLogic;

@override
void onInit() {
  super.onInit();
  chatLogic = Get.find<ChatPageLogic>();
}

  // Messages for current chat
  var messages = <Map<String, String>>[].obs;

  // Text field controller value
  var messageController = ''.obs;


  void sendMessage(String sender, String text) {
    if (text.trim().isNotEmpty) {
      messages.add({'sender': sender, 'message': text});
      messageController.value = '';
    }
  }

  // Leave group method - removes group from joinedGroups and clears messages
void leaveGroup(String groupName) {
  chatLogic.leaveGroup(groupName);
  messages.clear();
}

}
