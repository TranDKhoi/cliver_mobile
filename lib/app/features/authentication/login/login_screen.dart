import 'package:cliver_mobile/app/common_widgets/custom_button.dart';
import 'package:cliver_mobile/app/common_widgets/custom_textfield.dart';
import 'package:cliver_mobile/app/core/values/app_colors.dart';
import 'package:cliver_mobile/app/features/authentication/login/widgets/fb_gg_btn.dart';
import 'package:cliver_mobile/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35).copyWith(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "login".tr,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showLanguageDialog(context);
                    },
                    child: const Icon(
                      Icons.language_outlined,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
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
              CustomTextField(controller: _email, hintText: "Email".tr),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _pass,
                hintText: "Password".tr,
                secureText: true,
                type: "pass",
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forget Password?".tr,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(
                  text: "login".tr,
                  callback: () {
                    loginFunc();
                  }),
              const SizedBox(height: 30),
              Center(child: Text("Don’t Have An Account?".tr)),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Get.toNamed(signUpScreenRoute);
                },
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Register".tr.toUpperCase(),
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
    );
  }

  loginFunc() {
    if (_email.text.isEmpty || _pass.text.isEmpty) {
      showSnackBar(context, "Please enter your email and password");
    }
    //call api

    //

    // navigate to home screen
  }
}
