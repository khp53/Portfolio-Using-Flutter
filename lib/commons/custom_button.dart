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

  void _onHover(bool isHovering) {
    setState(() {
      _motionHovering = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      opaque: false,
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 600),
        height: 70,
        decoration: BoxDecoration(
          color: _motionHovering ? widget.color : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: widget.color,
            width: 2,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
