import 'package:cliver_mobile/app/core/utils/utils.dart';
import 'package:cliver_mobile/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../core/values/app_colors.dart';

class InputPhoneScreen extends StatefulWidget {
  const InputPhoneScreen({Key? key}) : super(key: key);

  @override
  State<InputPhoneScreen> createState() => _InputPhoneScreenState();
}

class _InputPhoneScreenState extends State<InputPhoneScreen> {
  final TextEditingController _phone = TextEditingController();

  @override
  void dispose() {
    _phone.dispose();
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
                Text(
                  "Please enter your phone number".tr,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _phone,
                  decoration: InputDecoration(
                    prefixIcon: Wrap(
                      direction: Axis.vertical,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15)
                              .copyWith(top: 5),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/icons/vn_icon.png",
                              ),
                              const SizedBox(width: 5),
                              Container(
                                color: AppColors.secondaryColor,
                                height: 35,
                                width: 1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                const SizedBox(height: 20),
                CustomButton(
                    text: "Next".tr,
                    callback: () {
                      toVerifyPhoneScreen();
                    }),
                const SizedBox(height: 30),
                Center(child: Text("Already Have An Account?".tr)),
                InkWell(
                  onTap: () {
                    Get.offAllNamed(loginScreenRoute);
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

  void toVerifyPhoneScreen() {
    if (_phone.text.isEmpty) {
      showSnackBar(context, "Please enter your phone!".tr);
      return;
    }

    Get.toNamed(verifyPhoneScreenRoute, arguments: _phone.text);
  }
}
