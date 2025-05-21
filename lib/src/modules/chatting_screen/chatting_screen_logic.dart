import 'package:get/get.dart';

class ChattingScreenController extends GetxController {
  var messages = <Map<String, String>>[].obs;
  var messageController = ''.obs;

  void sendMessage(String sender, String text) {
    if (text.trim().isNotEmpty) {
      messages.add({'sender': sender, 'message': text});
      messageController.value = '';
    }
  }
}
