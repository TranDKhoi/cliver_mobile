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
    return Stack(
      children: [
        TextFormField(
          obscureText: widget.secureText,
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
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
              child: AnimatedSwitcher(
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                duration: const Duration(milliseconds: 200),
                child: widget.secureText
                    ? const Icon(Icons.visibility_sharp)
                    : const SizedBox(
                        child: Icon(Icons.visibility_off_sharp),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
