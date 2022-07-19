import 'package:cliver_mobile/app/core/utils/size_config.dart';
import 'package:cliver_mobile/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';

class PageImageAnimation extends StatefulWidget {
  const PageImageAnimation({Key? key}) : super(key: key);

  @override
  State<PageImageAnimation> createState() => _PageImageAnimation();
}

class _PageImageAnimation extends State<PageImageAnimation>
    with TickerProviderStateMixin {
  late PageController pageController;
  int _selectedIndex = 1;

  @override
  void initState() {
    pageController =
        PageController(initialPage: 1, keepPage: true, viewportFraction: 0.7);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomSize().init(context);
    return Container(
      margin: EdgeInsets.only(top: getHeight(15)),
      height: getHeight(320),
      child: PageView.builder(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          var scale = _selectedIndex == index ? 1.0 : 0.8;
          return TweenAnimationBuilder(
            tween: Tween(begin: scale, end: scale),
            duration: const Duration(milliseconds: 350),
            builder: (BuildContext context, double value, Widget? child) {
              return Transform.scale(
                scale: value,
                child: child,
              );
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(list_image[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: getWidth(20),
                  bottom: getHeight(10),
                  child: Container(
                    color: Colors.transparent,
                    width: getWidth(235),
                    height: getHeight(47),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Bermudha, USA',
                            style: TextStyle(
                              color: AppColors.itemChildColor,
                              fontWeight: FontWeight.bold,
                              fontSize: getFont(22),
                            ),
                            children: [
                              TextSpan(
                                text: '\nStarting at \$1000',
                                style: TextStyle(
                                  color: AppColors.itemChildColor,
                                  fontSize: getFont(18),
                                  fontWeight: FontWeight.w100,
                                )
                              )
                            ]
                          ),
                        ),
                        CircleAvatar(
                          radius: getHeight(40 / 2),
                          backgroundColor: AppColors.selectedNavBarColor,
                          child: const Icon(
                            Icons.favorite,
                            color: AppColors.itemChildColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: list_image.length,
      ),
    );
  }
}

List<String> list_image = [
  'assets/images/img1.png',
  'assets/images/img1.png',
  'assets/images/img1.png',
  'assets/images/img1.png',
  'assets/images/img1.png',
  'assets/images/img1.png',
];
