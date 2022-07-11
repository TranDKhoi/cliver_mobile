import 'package:cliver_mobile/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/custom_bottom_navigation_bar.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int index = 0;
  List<Widget> pages = const [
    Center(
      child: Text(
        'Animation bottom',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    ),
    Center(
      child: Text(
        'Animation bottom',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    ),
    Center(
      child: Text(
        'Animation bottom',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    ),
    Center(
      child: Text(
        'Animation bottom',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: pages[index],
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget buildBottomNavigation() {
    return BottomNavigationBarCustom(
      backgroundColor: AppColors.backgroundColor,
      showElevation: false,
      itemCornerRadius: 15,
      items: <BottomNavigationBarCustomItem>[
        BottomNavigationBarCustomItem(
          title: 'Home'.tr,
          icon: const Icon(Icons.home_filled),
          inactiveColor: AppColors.secondaryColor,
          activeColor: AppColors.selectedNavBarColor,
          childColor: AppColors.itemChildColor,
        ),
        BottomNavigationBarCustomItem(
          title: 'Chat'.tr,
          icon: const Icon(Icons.message),
          inactiveColor: AppColors.secondaryColor,
          activeColor: AppColors.selectedNavBarColor,
          childColor: AppColors.itemChildColor,
        ),
        BottomNavigationBarCustomItem(
          title: 'Order'.tr,
          icon: const Icon(Icons.receipt_long),
          inactiveColor: AppColors.secondaryColor,
          activeColor: AppColors.selectedNavBarColor,
          childColor: AppColors.itemChildColor,
        ),
        BottomNavigationBarCustomItem(
          title: 'Profile'.tr,
          icon: const Icon(Icons.person),
          inactiveColor: AppColors.secondaryColor,
          activeColor: AppColors.selectedNavBarColor,
          childColor: AppColors.itemChildColor,
        ),
      ],
      onItemSelected: (index) => setState(() {
        this.index = index;
      }),
      selectedIndex: index,
    );
  }
}
