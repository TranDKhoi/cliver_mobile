import 'package:cliver_mobile/app/features/authentication/forget_pass/forget_pass_screen.dart';
import 'package:cliver_mobile/app/features/authentication/forget_pass/verify_email_screen.dart';
import 'package:cliver_mobile/app/features/authentication/signup/screens/input_phone_screen.dart';
import 'package:cliver_mobile/app/features/authentication/signup/screens/success_screen.dart';
import 'package:cliver_mobile/app/features/authentication/signup/screens/verify_phone_screen.dart';
import 'package:cliver_mobile/app/features/bottom_navigation_bar/my_bottom_bar.dart';
import 'package:cliver_mobile/app/routes/routes.dart';
import 'package:get/get.dart';

import '../features/authentication/login/login_screen.dart';
import '../features/authentication/signup/screens/signup_screen.dart';

//routes navigation
class AppPages {
  static final pages = [
    //AUTHENTICATION ROUTES
    GetPage(
      name: loginScreenRoute,
      page: () => const LoginScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: signUpScreenRoute,
        page: () => const SignUpScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: inputPhoneScreenRoute,
        page: () => const InputPhoneScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: verifyPhoneScreenRoute,
        page: () => const VerifyPhoneScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: successScreenRoute,
        page: () => const SuccessScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: forgetPassScreenRoute,
        page: () => const ForgetPassScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: verifyEmailScreenRoute,
        page: () => const VerifyEmailScreen(),
        transition: Transition.rightToLeft),
    GetPage(
      name: myBottomBarRoute,
      page: () => const MyBottomBar(),
      transition: Transition.fadeIn,
    ),
  ];
}
