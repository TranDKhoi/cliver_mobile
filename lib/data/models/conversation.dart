import 'package:cliver_mobile/data/models/message.dart';

class Conversation {
  String username;
  List<Message> messages = Message.getMessages();
  bool isOnline;
  bool isReaded;

  Conversation({
    required this.username,
    required this.isOnline,
    required this.isReaded,
  });

  static List<Conversation> getConversations() {
    return [
      Conversation(
        username: 'Kiều Bá Dương',
        isOnline: true,
        isReaded: false,
      ),
      Conversation(
        username: 'Trần Đình Khôi',
        isOnline: false,
        isReaded: true,
      ),
      Conversation(
        username: 'Lê Hải Phong',
        isOnline: true,
        isReaded: false,
      ),
      Conversation(
        username: 'Đỗ Thành Đạt',
        isOnline: false,
        isReaded: true,
      ),
      Conversation(
        username: 'Nguyễn Tấn Trần Minh Khang',
        isOnline: true,
        isReaded: false,
      ),
      Conversation(
        username: 'Nguyễn Hữu Minh Sang',
        isOnline: false,
        isReaded: true,
      ),
      Conversation(
        username: 'Hoàng Đình Hiếu',
        isOnline: true,
        isReaded: false,
      ),
      Conversation(
        username: 'Lê Thành Đạt',
        isOnline: false,
        isReaded: true,
      ),
      Conversation(
        username: 'Nguyễn Trần Công Trung',
        isOnline: true,
        isReaded: false,
      ),
      Conversation(
        username: 'Vũ Minh Đức',
        isOnline: false,
        isReaded: true,
      ),
    ];
  }
}
