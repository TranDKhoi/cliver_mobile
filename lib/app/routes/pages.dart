import 'package:cliver_mobile/app/routes/routes.dart';
import 'package:flutter/material.dart';

import '../features/authentication/login_screen.dart';
import '../features/authentication/signup_screen.dart';

//routes navigation
Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case loginScreenRoute:
      return MaterialPageRoute(
          builder: (_) => const LoginScreen(), settings: routeSettings);
    case signUpScreenRoute:
      return MaterialPageRoute(
          builder: (_) => const SignUpScreen(), settings: routeSettings);
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("Screen error!"),
                ),
              ),
          settings: routeSettings);
  }
}
