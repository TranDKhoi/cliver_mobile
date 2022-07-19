import 'package:cliver_mobile/app/core/utils/size_config.dart';
import 'package:cliver_mobile/app/core/values/app_colors.dart';
import 'package:cliver_mobile/app/features/buyer/home_screen/widget/page_images_animation.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
              margin: EdgeInsets.symmetric(
                  horizontal: getWidth(20), vertical: getHeight(20)),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: getHeight(15), horizontal: getWidth(20)),
                  fillColor: AppColors.fillColorTextField,
                  filled: true,
                  hintText: 'Search your trip'.tr,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0.0, color: Colors.white),
                    borderRadius: BorderRadius.circular(86.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0.0, color: Colors.white),
                    borderRadius: BorderRadius.circular(86.0),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(getWidth(7)),
                    child: CircleAvatar(
                      radius: getHeight(40 / 2),
                      backgroundColor: AppColors.iconFindColor,
                      child: const Icon(
                        Icons.search,
                        color: AppColors.itemChildColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const PageImageAnimation(),
            SizedBox(height: getHeight(20)),
            Padding(
              padding: EdgeInsets.only(left: getWidth(33)),
              child: Text(
                'PopularCategories'.tr,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: getFont(20),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: getHeight(7),
                left: getWidth(33),
              ),
              height: getHeight(85),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return CircleAvatar(
                    radius: getWidth(55 / 2),
                    child: Image.asset(
                      list_icon[index],
                    ),
                  );
                },
                itemCount: list_icon.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

List<String> list_icon = [
  'assets/images/img.png',
  'assets/images/img.png',
  'assets/images/img.png',
  'assets/images/img.png',
  'assets/images/img.png',
  'assets/images/img.png',
];
