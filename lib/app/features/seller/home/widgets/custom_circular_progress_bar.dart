import 'package:flutter/material.dart';

import '../../../../core/values/app_colors.dart';

class CustomCircularBar extends StatelessWidget {
  const CustomCircularBar({Key? key, required this.value, required this.label})
      : super(key: key);

  final double value;
  final String label;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            SizedBox(
              width: size.width / 8,
              height: size.width / 8,
              child: CircularProgressIndicator(
                value: value,
                strokeWidth: 2,
                backgroundColor: AppColors.secondaryColor,
                color: (value >= 0 && value <= 0.4)
                    ? Colors.red
                    : (value >= 0.5 && value <= 0.7)
                        ? Colors.yellow
                        : Colors.green,
              ),
            ),
            Text(
              "${(value * 100).toInt().toString()}%",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 90,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
