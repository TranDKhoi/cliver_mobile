import 'package:flutter/material.dart';

class ChatFilter {
  IconData icon;
  String text;

  ChatFilter({
    required this.icon,
    required this.text,
  });

  static List<ChatFilter> getListChatFilter() {
    return [
      ChatFilter(
        icon: Icons.all_inbox_outlined,
        text: 'All',
      ),
      ChatFilter(
        icon: Icons.mail_outline,
        text: 'Unread',
      ),
      ChatFilter(
        icon: Icons.star_border_outlined,
        text: 'Starred',
      ),
      ChatFilter(
        icon: Icons.archive_outlined,
        text: 'Archive',
      ),
      ChatFilter(
        icon: Icons.block,
        text: 'Spam',
      ),
      ChatFilter(
        icon: Icons.ballot_outlined,
        text: 'Custom offers',
      ),
    ].toList();
  }
}
