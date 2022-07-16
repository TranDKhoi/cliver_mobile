import 'package:cliver_mobile/app/core/utils/size_config.dart';
import 'package:cliver_mobile/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyerHomeScreen extends StatelessWidget {
  const BuyerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColorHomeScreen,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getWidth(20),
            ),
            child: Icon(
              Icons.notifications,
              size: getWidth(27),
            ),
          ),
        ],
        toolbarHeight: getHeight(100),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: getWidth(33)),
            child: Text(
              'Go'.tr,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: getFont(28),
                color: AppColors.textColor,
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                fillColor: AppColors.fillColorTextField,
                filled: true,
                hintText: 'Username',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0.0, color: Colors.white),
                  borderRadius: BorderRadius.circular(86.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
