import 'package:cliver_mobile/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatefulWidget {
  const CustomCircleAvatar({Key? key, required this.isOnline})
      : super(key: key);

  final bool isOnline;

  @override
  State<CustomCircleAvatar> createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.secondaryColor,
          radius: size.width * 0.035,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: size.width * 0.022,
            width: size.width * 0.022,
            decoration: BoxDecoration(
                color: widget.isOnline
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
          ),
        ),
      ],
    );
  }
}
