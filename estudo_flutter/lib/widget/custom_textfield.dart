import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color color;
  final Color cursorColor;
  final Color borderSideColor;
  final Color textColor;
  final String textLabel;

  const CustomTextField(
      {this.controller,
      this.color = Colors.black,
      this.cursorColor = Colors.black,
      this.borderSideColor = Colors.black,
      this.textColor = Colors.black,
      this.textLabel = "Label"});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: cursorColor,
      style: TextStyle(
        color: color,
      ),
      decoration: InputDecoration(
        labelText: textLabel,
        labelStyle: TextStyle(color: textColor),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderSideColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: borderSideColor),
        ),
      ),
    );
  }
}
