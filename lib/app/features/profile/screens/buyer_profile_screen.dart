import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';

class BuyerProfileScreen extends StatelessWidget {
  const BuyerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: const [
              Icon(Icons.arrow_back_sharp),
              Text('Buyer profile'),
            ],
          ),
        ),
        body: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.25,
                    width: size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                    ),
                  ),
                  Text(
                    'Kiều Bá Dương',
                    style: TextStyle(
                      fontSize: size.height * 0.02,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'My Cliver',
              style: TextStyle(
                fontSize: size.height * 0.02,
              ),
            ),
            RowSetting(
                icon: Icons.diamond_outlined, text: 'Get inspired', size: size),
            RowSetting(
              icon: Icons.favorite,
              text: 'Saved',
              size: size,
            ),
            RowSetting(
              icon: Icons.interests,
              text: 'My interests',
              size: size,
            ),
            Text(
              'Buying',
              style: TextStyle(
                fontSize: size.height * 0.02,
              ),
            ),
            RowSetting(
              icon: Icons.interests,
              text: 'Manage requests',
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}

class RowSetting extends StatelessWidget {
  final IconData icon;
  final String text;
  final Size size;
  const RowSetting(
      {Key? key, required this.icon, required this.text, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.primaryColor,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: size.height * 0.02,
          ),
        ),
        const Expanded(child: SizedBox()),
        const Icon(
          Icons.arrow_back_sharp,
        ),
      ],
    );
  }
}
