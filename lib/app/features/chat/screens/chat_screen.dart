import 'package:cliver_mobile/app/core/utils/utils.dart';
import 'package:cliver_mobile/app/core/values/app_colors.dart';
import 'package:cliver_mobile/app/features/chat/widgets/app_bar_chat.dart';
import 'package:cliver_mobile/app/features/chat/widgets/bottom_bar_chat.dart';
import 'package:cliver_mobile/data/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _hideTime = true;
  int _hideTimeIndex = -1;
  int _copyTextIndex = -1;
  final _messageInput = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  var messages = Get.arguments;

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

  void _showCopyDialog(int index) {
    setState(() {
      _copyTextIndex = index;
    });
  }

  void _scrollToEnd() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
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
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        _scrollToEnd();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DateFormat formatter = DateFormat('jm');

    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            setState(() {
              _copyTextIndex = -1;
            });
          },
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
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  InkWell(
                                    onTap: (() => _showTimeSent(index)),
                                    onLongPress: () => _showCopyDialog(index),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: size.width * 0.7),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: (messages[index].isSentByMe)
                                            ? AppColors.lightGreenColor
                                            : Colors.white,
                                        boxShadow: (!messages[index].isSentByMe)
                                            ? const [
                                                BoxShadow(
                                                  blurRadius: 50,
                                                  color:
                                                      AppColors.greyShadowColor,
                                                  offset: Offset(20, 20),
                                                ),
                                              ]
                                            : null,
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
                                  if (_copyTextIndex == index)
                                    if (messages[index].isSentByMe)
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Clipboard.setData(
                                                      ClipboardData(
                                                          text: messages[index]
                                                              .text));
                                                  showSnackBar(
                                                      context, 'Text copied');
                                                  setState(() =>
                                                      _copyTextIndex = -1);
                                                },
                                                child: Container(
                                                  width: size.width * 0.3,
                                                  height: size.height * 0.045,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.copy,
                                                        color: AppColors
                                                            .primaryColor,
                                                        size:
                                                            size.height * 0.03,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'Copy',
                                                        style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.02,
                                                          color: AppColors
                                                              .blackColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.3,
                                                height: size.height * 0.045,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: size.width * 0.3,
                                            height: size.height * 0.045,
                                          ),
                                        ],
                                      )
                                    else
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: size.width * 0.3,
                                                height: size.height * 0.045,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Clipboard.setData(
                                                      ClipboardData(
                                                          text: messages[index]
                                                              .text));
                                                  showSnackBar(
                                                      context, 'Text copied');
                                                  setState(() =>
                                                      _copyTextIndex = -1);
                                                },
                                                child: Container(
                                                  width: size.width * 0.3,
                                                  height: size.height * 0.045,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppColors.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.copy,
                                                        color: Colors.white,
                                                        size:
                                                            size.height * 0.03,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'Copy',
                                                        style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.02,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: size.width * 0.3,
                                            height: size.height * 0.045,
                                          ),
                                        ],
                                      )
                                ],
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
