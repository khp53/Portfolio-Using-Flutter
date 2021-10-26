import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final onPressed;
  final String text;
  final color;
  final tColor;
  const CustomButtom(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.color,
      this.tColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: Size(300, 80),
        side: BorderSide(width: 3.5, color: color),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: tColor,
          fontSize: 25,
        ),
      ),
    );
  }
}
