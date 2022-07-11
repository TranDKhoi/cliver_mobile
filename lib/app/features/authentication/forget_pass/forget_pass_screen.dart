import 'package:cliver_mobile/app/common_widgets/custom_textfield.dart';
import 'package:cliver_mobile/app/core/utils/utils.dart';
import 'package:cliver_mobile/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/custom_back_button.dart';
import '../../../common_widgets/custom_button.dart';

class ForgetPassScreen extends StatefulWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPassScreen> createState() => _ForgetPassScreenState();
}

class _ForgetPassScreenState extends State<ForgetPassScreen> {
  final TextEditingController _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 35).copyWith(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(),
                const SizedBox(height: 30),
                Text(
                  "Forget Password".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Please enter your email address to reset your password".tr,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 30),
                CustomTextField(controller: _email, hintText: "Email"),
                const SizedBox(height: 40),
                CustomButton(
                  text: "Send Code".tr,
                  callback: () {
                    toVerifyEmailScreen();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toVerifyEmailScreen() {
    if (_email.text.isEmpty) {
      showSnackBar(context, "Please enter your email!".tr);
      return;
    }

    Get.toNamed(verifyEmailScreenRoute, arguments: _email.text);
  }
}
