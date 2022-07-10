import 'package:cliver_mobile/app/core/utils/localization_service.dart';
import 'package:cliver_mobile/app/core/values/app_colors.dart';
import 'package:cliver_mobile/app/features/authentication/login/login_screen.dart';
import 'package:cliver_mobile/app/features/onboarding/onboarding.dart';
import 'package:cliver_mobile/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/user_controller.dart';
import 'features/bottom_navigation_bar/buyer_bottom_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      defaultTransition: Transition.cupertino,
      theme: AppColors().lightTheme,
      home: SafeArea(
        child: BuyerBottomBar(),
      ),
    );
  }
}
