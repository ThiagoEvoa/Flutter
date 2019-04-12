import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final Function clicked;
  final Color buttonColor;
  final String text;
  final Color textColor;

  const CustomRaisedButton(
      {@required this.clicked,
      this.buttonColor = Colors.black,
      this.text = "Button",
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: clicked,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: buttonColor,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
    );
    ;
  }
}
