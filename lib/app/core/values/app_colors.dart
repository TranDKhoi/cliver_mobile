import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors extends GetxController {
  static const primaryColor = Color.fromRGBO(27, 186, 133, 1.0);
  static const secondaryColor = Color.fromRGBO(179, 178, 178, 1.0);
  static const backgroundColor = Color(0xffF3F5F6);
  static const Color greyBackgroundColor = Color(0xffebecee);
  static const selectedNavBarColor = Color.fromRGBO(28, 185, 134, 1);
  static const unselectedNavBarColor = Colors.transparent;
  static const itemChildColor = Colors.white;

  //==========================================================================//
  //LIGHT THEME
  ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: ThemeData.light().textTheme.apply(
          fontFamily: "PoppinsRegular",
        ),
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
    hintColor: secondaryColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    inputDecorationTheme:
        const InputDecorationTheme(fillColor: Colors.white, filled: true),
  );

  //==========================================================================//
  //DARK THEME
  ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: ThemeData.dark().textTheme.apply(
          fontFamily: "PoppinsRegular",
        ),
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
    hintColor: secondaryColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    inputDecorationTheme:
        const InputDecorationTheme(fillColor: Color(0xff292a2a), filled: true),
  );
}
