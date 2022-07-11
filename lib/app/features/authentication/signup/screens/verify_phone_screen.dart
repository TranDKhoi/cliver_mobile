import 'package:cliver_mobile/app/common_widgets/custom_back_button.dart';
import 'package:cliver_mobile/app/common_widgets/custom_button.dart';
import 'package:cliver_mobile/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';

import '../../../../core/utils/utils.dart';
import '../../../../core/values/app_colors.dart';

class VerifyPhoneScreen extends StatefulWidget {
  const VerifyPhoneScreen({Key? key}) : super(key: key);

  @override
  State<VerifyPhoneScreen> createState() => _VerifyPhoneScreenState();
}

class _VerifyPhoneScreenState extends State<VerifyPhoneScreen> {
  final String _phonenum = Get.arguments ?? "0";
  bool _onEditing = true;
  String _code = "";

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
                  "Verify Code".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Check your sms inbox".tr + _phonenum,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 30),
                Center(
                  child: VerificationCode(
                    itemSize: 80,
                    fillColor: Colors.transparent,
                    digitsOnly: true,
                    textStyle: const TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    underlineColor: AppColors.primaryColor,
                    onEditing: (bool value) {
                      setState(() {
                        _onEditing = value;
                      });
                      if (!_onEditing) FocusScope.of(context).unfocus();
                    },
                    onCompleted: (String value) {
                      setState(() {
                        _code = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      "${"Didn’t Receive A Code?".tr}  ",
                      style: const TextStyle(fontSize: 14),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Resend Code".tr,
                        style: const TextStyle(
                          fontSize: 14,
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Confirm".tr,
                  callback: () {
                    toSuccessScreen();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void toSuccessScreen() {
    if (_code.isEmpty) {
      showSnackBar(context, "Please enter the code".tr);
      return;
    }
    Get.offAllNamed(successScreenRoute,
        arguments: "Account Created Successfully");
  }
}
