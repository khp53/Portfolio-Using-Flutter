import 'package:flutter/material.dart';

class CustomButtom extends StatefulWidget {
  final onPressed;
  final String text;
  final color;
  final tColor;
  CustomButtom(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.color,
      this.tColor})
      : super(key: key);

  @override
  State<CustomButtom> createState() => _CustomButtomState();
}

class _CustomButtomState extends State<CustomButtom> {
  Color? colors;
  bool _motionHovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: OutlinedButton(
        onHover: (value) {
          _motionHovering = !_motionHovering;
          colors = widget.color;
          setState(() {});
        },
        style: OutlinedButton.styleFrom(
          fixedSize: Size(300, 80),
          side: BorderSide(width: 3.5, color: widget.color),
          backgroundColor: _motionHovering ? colors : Colors.transparent,
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
            color: _motionHovering ? Colors.black : widget.tColor,
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
