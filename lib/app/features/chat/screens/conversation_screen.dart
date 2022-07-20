import 'package:cliver_mobile/app/controller/chat_controller.dart';
import 'package:cliver_mobile/app/features/chat/widgets/conversation_item.dart';
import 'package:cliver_mobile/data/models/chat_filter.dart';
import 'package:cliver_mobile/data/models/conversation.dart';
import 'package:cliver_mobile/data/models/label_filter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/values/app_colors.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({Key? key}) : super(key: key);

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final _conversations = Conversation.getConversations();
  final chatController = ChatController.instance;
  final _listChatFilter = ChatFilter.getListChatFilter();
  final _listLabel = LabelFilter.getListLabel();
  var _selectedFilter = 0;
  var _selectedLabel = -1;

  dynamic _textLength;
  bool _isEditted = false;

  bool _isOneBoxChecked() {
    for (int i = 0; i < chatController.listCheckBoxValue.length; i++) {
      if (chatController.listCheckBoxValue[i]) {
        return true;
      }
    }
    return false;
  }

  void _clearCheckBox() {
    for (int i = 0; i < chatController.listCheckBoxValue.length; i++) {
      chatController.listCheckBoxValue[i] = false;
    }
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final DateFormat formatter = DateFormat('jm');
    _textLength = size.width * 0.6;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.backgroundColor,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (!_isEditted) {
                      _textLength = size.width * 0.8;
                    } else {
                      _textLength = size.width * 0.6;
                      _clearCheckBox();
                    }
                    _isEditted = !_isEditted;
                  });
                },
                child: Text(
                  'Edit',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: size.height * 0.03,
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              Text(
                'Inbox',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: size.height * 0.035,
                ),
              ),
              const Expanded(child: SizedBox()),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    isDismissible: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    builder: (context) => DraggableScrollableSheet(
                      initialChildSize: 0.5,
                      maxChildSize: 0.9,
                      expand: false,
                      builder: (context, scrollController) {
                        return StatefulBuilder(
                          builder:
                              (BuildContext context, StateSetter setState) =>
                                  SingleChildScrollView(
                            controller: scrollController,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      height: 4,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(90),
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Filters',
                                    style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: size.height * 0.03,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              _listChatFilter[index].icon,
                                              color: Colors.grey,
                                              size: size.height * 0.05,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _selectedFilter = index;
                                                  });
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration:
                                                      const BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        width: 1,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        _listChatFilter[index]
                                                            .text,
                                                        style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.02,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .blackColor,
                                                        ),
                                                      ),
                                                      const Expanded(
                                                          child: SizedBox()),
                                                      (_selectedFilter == index)
                                                          ? Icon(
                                                              Icons.check,
                                                              size:
                                                                  size.height *
                                                                      0.03,
                                                              color: AppColors
                                                                  .primaryColor,
                                                            )
                                                          : const SizedBox(),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                                    separatorBuilder: (context, _) =>
                                        const SizedBox(),
                                    itemCount: _listChatFilter.length,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Labels',
                                    style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: size.height * 0.03,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.label_important_outline,
                                              color: Colors.grey,
                                              size: size.height * 0.05,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _selectedLabel = index;
                                                  });
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration:
                                                      const BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        width: 1,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        _listLabel[index].text,
                                                        style: TextStyle(
                                                          fontSize:
                                                              size.height *
                                                                  0.02,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColors
                                                              .blackColor,
                                                        ),
                                                      ),
                                                      const Expanded(
                                                          child: SizedBox()),
                                                      (_selectedLabel == index)
                                                          ? Icon(
                                                              Icons.check,
                                                              size:
                                                                  size.height *
                                                                      0.03,
                                                              color: AppColors
                                                                  .primaryColor,
                                                            )
                                                          : const SizedBox(),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                    separatorBuilder: (context, _) =>
                                        const SizedBox(),
                                    itemCount: _listLabel.length,
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                child: Icon(
                  Icons.tune,
                  color: Colors.black,
                  size: size.height * 0.05,
                ),
              ),
            ],
          ),
        ),
        body: GestureDetector(
          onTap: () {
            setState(() {
              _isEditted = false;
              _clearCheckBox();
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              itemBuilder: ((context, index) {
                return ConversationItem(
                  index: index,
                  size: size,
                  isEditted: _isEditted,
                  textLength: _textLength,
                  conversation: _conversations[index],
                  formatter: formatter,
                  notifyParent: refresh,
                );
              }),
              separatorBuilder: (context, _) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: _conversations.length,
            ),
          ),
        ),
        bottomNavigationBar: Visibility(
          visible: _isEditted,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_isOneBoxChecked()) {
                      setState(() {
                        for (int i =
                                chatController.listCheckBoxValue.length - 1;
                            i > 0;
                            i--) {
                          if (chatController.listCheckBoxValue[i]) {
                            _conversations.removeAt(i);
                            chatController.listCheckBoxValue.removeLast();
                          }
                        }
                        _clearCheckBox();
                      });
                    }
                  },
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      color: (_isOneBoxChecked())
                          ? AppColors.blackColor
                          : AppColors.lightGreyColor,
                      fontSize: size.height * 0.03,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_isOneBoxChecked()) {
                      setState(() {
                        for (int i = 0;
                            i < chatController.listCheckBoxValue.length;
                            i++) {
                          if (chatController.listCheckBoxValue[i]) {
                            _conversations[i].isReaded = true;
                          }
                        }
                        _clearCheckBox();
                      });
                    }
                  },
                  child: Text(
                    'Mark read',
                    style: TextStyle(
                      color: (_isOneBoxChecked())
                          ? AppColors.blackColor
                          : AppColors.lightGreyColor,
                      fontSize: size.height * 0.03,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
