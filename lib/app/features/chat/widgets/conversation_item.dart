import 'package:cliver_mobile/app/controller/chat_controller.dart';
import 'package:cliver_mobile/app/routes/routes.dart';
import 'package:cliver_mobile/data/models/conversation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/values/app_colors.dart';

class ConversationItem extends StatefulWidget {
  final int index;
  final Size size;
  final bool isEditted;
  final double textLength;
  final Conversation conversation;
  final DateFormat formatter;
  final Function() notifyParent;

  const ConversationItem({
    Key? key,
    required this.size,
    required this.isEditted,
    required this.textLength,
    required this.conversation,
    required this.formatter,
    required this.index,
    required this.notifyParent,
  }) : super(key: key);

  @override
  State<ConversationItem> createState() => _ConversationItemState();
}

class _ConversationItemState extends State<ConversationItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: const ActionPane(
        motion: ScrollMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            onPressed: null,
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.mail_outline,
            label: 'Unread',
          ),
        ],
      ),
      endActionPane: const ActionPane(
        extentRatio: 0.7,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: null,
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
            icon: Icons.more_horiz,
            label: 'More',
          ),
          SlidableAction(
            onPressed: null,
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            icon: Icons.archive_outlined,
            label: 'Archive',
          ),
          SlidableAction(
            onPressed: null,
            backgroundColor: Colors.amber,
            foregroundColor: Colors.white,
            icon: Icons.star_border_rounded,
            label: 'Star',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: (() {
          Get.toNamed(chatScreenRoute, arguments: widget.conversation.messages);
        }),
        child: Container(
          color: Colors.white,
          height: widget.size.height * 0.125,
          child: Row(
            children: [
              Visibility(
                visible: widget.isEditted,
                child: Transform.scale(
                  scale: 1.4,
                  child: Checkbox(
                    value:
                        ChatController.instance.listCheckBoxValue[widget.index],
                    onChanged: (value) {
                      setState(() {
                        ChatController
                            .instance.listCheckBoxValue[widget.index] = value!;
                        widget.notifyParent();
                      });
                    },
                    shape: const CircleBorder(),
                    fillColor:
                        MaterialStateProperty.all(AppColors.lightGreyColor),
                  ),
                ),
              ),
              SizedBox(
                width: widget.size.width * 0.02,
              ),
              Stack(
                children: [
                  Container(
                    height: widget.size.height * 0.07,
                    width: widget.size.height * 0.07,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      color: Colors.yellow,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: widget.size.height * 0.02,
                      width: widget.size.height * 0.02,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: (widget.conversation.isOnline)
                            ? Colors.green
                            : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: widget.size.width * 0.04,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.conversation.username,
                            style: TextStyle(
                              fontSize: widget.size.height * 0.018,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        Text(
                          widget.formatter.format(
                            widget
                                .conversation
                                .messages[
                                    widget.conversation.messages.length - 1]
                                .date,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: widget.textLength,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.conversation.messages[0].text,
                              style: TextStyle(
                                color: (widget.conversation.isReaded)
                                    ? Colors.grey
                                    : Colors.black,
                                fontWeight: (widget.conversation.isReaded)
                                    ? null
                                    : FontWeight.bold,
                                fontSize: widget.size.height * 0.016,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
