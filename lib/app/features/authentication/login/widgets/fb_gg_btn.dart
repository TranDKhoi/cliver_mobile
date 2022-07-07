import 'package:flutter/material.dart';

class GGFBBtn extends StatelessWidget {
  const GGFBBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Color(int.parse("0xFFEBC9C6")),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                "GOOGLE",
                style: TextStyle(
                  color: Color.fromRGBO(212, 70, 56, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
        Flexible(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Color(int.parse("0xFFC6D2E4")),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                "FACEBOOK",
                style: TextStyle(
                  color: Color.fromRGBO(66, 103, 178, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
