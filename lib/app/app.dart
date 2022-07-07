import 'package:cliver_mobile/app/core/utils/localization_service.dart';
import 'package:cliver_mobile/app/core/values/app_colors.dart';
import 'package:cliver_mobile/app/features/authentication/login/login_screen.dart';
import 'package:cliver_mobile/app/features/onboarding/onboarding.dart';
import 'package:cliver_mobile/app/routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/user_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initData();

    return GetMaterialApp(
      getPages: AppPages.pages,
      debugShowCheckedModeBanner: false,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        fontFamily: "PoppinsRegular",
        scaffoldBackgroundColor: AppColors.backgroundColor,
        colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: SafeArea(
        child: UserController.instance.isFirstTime
            ? const OnBoarding()
            : const LoginScreen(),
      ),
    );
  }

  initData() async {
    var pref = await SharedPreferences.getInstance();
    UserController.instance.isFirstTime = pref.getBool("isFirstTime") ?? true;
  }
}
