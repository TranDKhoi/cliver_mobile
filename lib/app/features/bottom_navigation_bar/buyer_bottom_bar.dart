import 'package:cliver_mobile/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common_widgets/custom_bottom_navigation_bar.dart';

class BuyerBottomBar extends StatefulWidget {
  const BuyerBottomBar({Key? key}) : super(key: key);

  @override
  State<BuyerBottomBar> createState() => _BuyerBottomBarState();
}

class _BuyerBottomBarState extends State<BuyerBottomBar> {
  int index = 0;

  Widget buidlBottomNavigation() {
    return BottomNavigationBarCustom(
      backgroundColor: AppColors.backgroundColor,
      showElevation: false,
      itemCornerRadius: 15,
      items: <BottomNavigationBarCustomItem>[
        BottomNavigationBarCustomItem(
          title: 'home'.tr,
          icon: const Icon(Icons.home_filled),
          inactiveColor: AppColors.secondaryColor,
          activeColor: AppColors.selectedNavBarColor,
          childColor: AppColors.itemChildColor,
        ),
        BottomNavigationBarCustomItem(
          title: 'home'.tr,
          icon: const Icon(Icons.explore_outlined),
          inactiveColor: AppColors.secondaryColor,
          activeColor: AppColors.selectedNavBarColor,
          childColor: AppColors.itemChildColor,
        ),
        BottomNavigationBarCustomItem(
          title: 'home'.tr,
          icon: const Icon(Icons.person),
          inactiveColor: AppColors.secondaryColor,
          activeColor: AppColors.selectedNavBarColor,
          childColor: AppColors.itemChildColor,
        ),
        BottomNavigationBarCustomItem(
          title: 'home'.tr,
          icon: const Icon(Icons.home_filled),
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

  Widget buildBody() {
    switch(index) {
      case 0:
        return const Center(
          child: Text(
            'Animation bottom',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        );
      default:
        return const Center(
          child: Text(
            'a bottom',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: buildBody(),
      bottomNavigationBar: buidlBottomNavigation(),
    );
  }
}
