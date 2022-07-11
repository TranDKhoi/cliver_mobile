import 'package:cliver_mobile/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../common_widgets/custom_textfield.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/values/app_colors.dart';
import '../../login/widgets/fb_gg_btn.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _repass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 35).copyWith(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Register".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 30),
                const GGFBBtn(),
                const SizedBox(height: 30),
                Center(
                  child: Text(
                    "OR".tr,
                    style: const TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                    controller: _fullname, hintText: "Full name".tr),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _email,
                  hintText: "Email".tr,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _pass,
                  hintText: "Password".tr,
                  type: "pass",
                  secureText: true,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _repass,
                  hintText: "Confirm Password".tr,
                  type: "pass",
                  secureText: true,
                ),
                const SizedBox(height: 10),
                CustomButton(
                    text: "Register".tr,
                    callback: () {
                      toPhoneScreen();
                    }),
                const SizedBox(height: 30),
                Center(child: Text("Already Have An Account?".tr)),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "login".tr.toUpperCase(),
                          style: const TextStyle(
                              letterSpacing: 2, color: AppColors.primaryColor),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                        child: Divider(
                          color: AppColors.primaryColor,
                          height: 9,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  toPhoneScreen() {
    if (isValidData()) {
      Get.toNamed(inputPhoneScreenRoute);
    }
  }

  bool isValidData() {
    if (_fullname.text.isEmpty ||
        _email.text.isEmpty ||
        _pass.text.isEmpty ||
        _repass.text.isEmpty) {
      showSnackBar(context, "Please enter the form!".tr);
      return false;
    }
    if (_pass.text != _repass.text) {
      showSnackBar(context, "The password does not match!".tr);
      return false;
    }
    return true;
  }
}
