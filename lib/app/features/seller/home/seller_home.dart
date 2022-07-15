import 'package:cliver_mobile/app/common_widgets/circle_avatar_online.dart';
import 'package:cliver_mobile/app/core/values/app_colors.dart';
import 'package:cliver_mobile/app/features/seller/home/widgets/card_earn.dart';
import 'package:cliver_mobile/app/features/seller/home/widgets/card_post.dart';
import 'package:cliver_mobile/app/features/seller/home/widgets/card_todo.dart';
import 'package:cliver_mobile/app/features/seller/home/widgets/custom_circular_progress_bar.dart';
import 'package:cliver_mobile/app/features/seller/home/widgets/custom_expanded.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellerHome extends StatefulWidget {
  const SellerHome({Key? key}) : super(key: key);

  @override
  State<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //USER NAME
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CustomCircleAvatar(
                      isOnline: false,
                    ),
                    SizedBox(width: 5),
                    Text("tranxyz88@gmail.com")
                  ],
                ),
              ),

              //summary statistic
              Column(
                children: [
                  Container(
                    color: const Color(0xff2A2B2E),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.01),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Here is how you're doing".tr,
                                style: TextStyle(color: Colors.white),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.help_outline,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "Seller level".tr,
                                style: TextStyle(color: Colors.white),
                              ),
                              const Spacer(),
                              Text(
                                "New Seller".tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "Next evaluation".tr,
                                style: TextStyle(color: Colors.white),
                              ),
                              const Spacer(),
                              Text(
                                "Feb 25, 2022".tr,
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                "Response time".tr,
                                style: TextStyle(color: Colors.white),
                              ),
                              const Spacer(),
                              Text(
                                "1 hour".tr,
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomCircularBar(
                                value: 0.8,
                                label: "Response time",
                              ),
                              CustomCircularBar(
                                value: 0.6,
                                label: "Order completion",
                              ),
                              CustomCircularBar(
                                value: 0.4,
                                label: "On-time delivery",
                              ),
                              CustomCircularBar(
                                value: 0,
                                label: "Positive rating",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomExpanded(),
                ],
              ),

              //CARD AREA
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: const [
                    cardEarn(),
                    cardTodo(),
                    cardPost(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
