import 'package:get/get.dart';

import '../../data/models/conversation.dart';

class ChatController extends GetxController {
  static ChatController instance = Get.put(ChatController());

  var listCheckBoxValue = List<bool>.filled(
    Conversation.getConversations().length,
    false,
    growable: true,
  );
}
