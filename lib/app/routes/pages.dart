import 'package:cliver_mobile/app/features/chat/screens/chat_screen.dart';
import 'package:cliver_mobile/app/features/chat/screens/conversation_screen.dart';
import 'package:cliver_mobile/app/routes/routes.dart';
import 'package:get/get.dart';

import '../features/authentication/login/login_screen.dart';
import '../features/authentication/signup_screen.dart';

//routes navigation
class AppPages {
  static final pages = [
    GetPage(
      name: loginScreenRoute,
      page: () => const LoginScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: signUpScreenRoute,
      page: () => const SignUpScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: chatScreenRoute,
      page: () => const ChatScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: conversationScreenRoute,
      page: () => const ConversationScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
