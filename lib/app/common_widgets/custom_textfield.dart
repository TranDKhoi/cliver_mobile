import 'package:cliver_mobile/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.secureText = false,
      this.maxLines = 1,
      this.type = "text"})
      : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  bool secureText;
  String type;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          TextFormField(
            obscureText: widget.secureText,
            controller: widget.controller,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.all(10),
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: AppColors.secondaryColor),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return "Enter ${widget.hintText}";
              }
              return null;
            },
            maxLines: widget.maxLines,
          ),
          Visibility(
            visible: widget.type == "pass",
            child: Positioned(
              right: 10,
              top: 12,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.secureText = !widget.secureText;
                    });
                  },
                  child: const Icon(Icons.remove_red_eye_sharp)),
            ),
          ),
        ],
      ),
    );
  }
}
