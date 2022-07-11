import 'package:cliver_mobile/app/common_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  double myOpac = 0;

  final String title = Get.arguments ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35).copyWith(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                onEnd: () {
                  setState(() {
                    myOpac = 1;
                  });
                },
                curve: Curves.bounceOut,
                duration: const Duration(milliseconds: 1000),
                tween: Tween<Size>(
                    begin: const Size(5, 5), end: MediaQuery.of(context).size),
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return Image.asset(
                    "assets/icons/success_icon.png",
                    width: value.width,
                    height: value.height / 3,
                  );
                },
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: myOpac,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Text(
                      "Congrats!".tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      title.tr,
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 100),
                    CustomButton(text: "Get Started".tr, callback: () {}),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}