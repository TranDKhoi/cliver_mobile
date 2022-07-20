import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/values/app_colors.dart';

class AppBarChat extends StatelessWidget {
  const AppBarChat({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.03,
        ),
        GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
            size: size.width * 0.08,
          ),
        ),
        SizedBox(
          width: size.width * 0.03,
        ),
        Container(
          height: size.width * 0.12,
          width: size.width * 0.12,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(90),
          ),
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Tooltip(
                message: 'Kiều Bá Dương',
                child: Text(
                  'Kiều Bá Dương',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.025,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
              ),
              Text(
                'Offline',
                style: TextStyle(
                  color: AppColors.lightGreyColor,
                  fontSize: size.height * 0.018,
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.phone,
          color: AppColors.primaryColor,
          size: size.width * 0.08,
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
        Icon(
          Icons.videocam_sharp,
          color: AppColors.primaryColor,
          size: size.width * 0.08,
        ),
        SizedBox(
          width: size.width * 0.05,
        ),
      ],
    );
  }
}
