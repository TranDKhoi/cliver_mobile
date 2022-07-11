import 'package:cliver_mobile/app/core/values/app_colors.dart';
import 'package:cliver_mobile/app/features/chat/widgets/app_bar_chat.dart';
import 'package:cliver_mobile/app/features/chat/widgets/bottom_bar_chat.dart';
import 'package:cliver_mobile/data/models/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _hideTime = true;
  int _hideTimeIndex = -1;
  final _messageInput = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Message> messages = [
    Message(
      text:
          "Hi, Aneeta, How’re You. I’m Jackson From College. Hope You’ll Be Fine And Also Your Family Aneeta. Waiting for your Reply !",
      date: DateTime.now().subtract(const Duration(minutes: 1)),
      isSentByMe: true,
    ),
    Message(
      text: "Yes we are fine, wow really nice",
      date: DateTime.now().subtract(const Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: "Please, Can you give me Notes",
      date: DateTime.now().subtract(const Duration(minutes: 1)),
      isSentByMe: true,
    ),
    Message(
      text: "Ok, I give you But Where!",
      date: DateTime.now().subtract(const Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: "Thanks, At College",
      date: DateTime.now().subtract(const Duration(minutes: 1)),
      isSentByMe: true,
    ),
  ].toList();

  void _showTimeSent(int index) {
    setState(() {
      if (_hideTimeIndex == index) {
        _hideTime = !_hideTime;
      } else {
        _hideTime = false;
      }
      _hideTimeIndex = index;
      if (index == messages.length - 1) {
        _scrollToEnd();
      }
    });
  }

  void _scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _sendMessage() {
    if (_messageInput.text.isNotEmpty) {
      final message = Message(
        text: _messageInput.text,
        date: DateTime.now(),
        isSentByMe: true,
      );
      setState(() {
        messages.add(message);
        _messageInput.clear();
      });
      FocusManager.instance.primaryFocus!.unfocus();
      _scrollToEnd();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DateFormat formatter = DateFormat('jm');

    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              AppBarChat(size: size),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: ListView.separated(
                    controller: _scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: (messages[index].isSentByMe)
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: (messages[index].isSentByMe)
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: (() => _showTimeSent(index)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: size.width * 0.7),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: (messages[index].isSentByMe)
                                        ? AppColors.lightGreenColor
                                        : Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Text(
                                      messages[index].text,
                                      style: TextStyle(
                                        fontSize: size.height * 0.02,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          (index == _hideTimeIndex && !_hideTime)
                              ? Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      formatter.format(messages[index].date),
                                      style: TextStyle(
                                        color: AppColors.lightGreyColor,
                                        fontSize: size.height * 0.015,
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox(),
                        ],
                      );
                    },
                    itemCount: messages.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                  ),
                ),
              ),
              BottomBarChat(
                size: size,
                messageInput: _messageInput,
                sendMessage: _sendMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
