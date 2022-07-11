import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';

class BottomBarChat extends StatelessWidget {
  const BottomBarChat(
      {Key? key,
      required this.size,
      required this.messageInput,
      required this.sendMessage})
      : super(key: key);
  final Size size;
  final TextEditingController messageInput;
  final VoidCallback sendMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 0.01,
        bottom: size.height * 0.03,
        left: size.width * 0.05,
        right: size.width * 0.05,
      ),
      child: Row(
        children: [
          Container(
            height: size.width * 0.1,
            width: size.width * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: const Icon(
              Icons.add,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(
            width: size.width * 0.03,
          ),
          Container(
            height: size.width * 0.1,
            width: size.width * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: const Icon(
              Icons.mic,
              color: AppColors.primaryColor,
            ),
          ),
          SizedBox(
            width: size.width * 0.03,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: size.width * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                        decoration: const InputDecoration.collapsed(
                          hintText: 'Write now...',
                        ),
                        controller: messageInput,
                        onSubmitted: (_) {
                          sendMessage();
                        }),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: sendMessage,
                    child: const Icon(
                      Icons.send,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
