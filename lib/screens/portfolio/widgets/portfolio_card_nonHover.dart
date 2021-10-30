import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/screens/portfolio/portfolio_viewmodel.dart';

class PortfolioCardNonHover extends StatelessWidget {
  final String title;
  final Color color1;
  final Color color2;
  final icon1;
  final icon2;
  final gitLink;
  final webLink;
  final PortfolioViewmodel viewmodel;
  PortfolioCardNonHover(
      {Key? key,
      required this.title,
      required this.color1,
      required this.color2,
      this.icon1,
      this.icon2,
      required this.viewmodel,
      this.webLink,
      this.gitLink})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildNonHoverWidget();
  }

  Container _buildNonHoverWidget() {
    return Container(
      width: 317,
      height: 317,
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  icon1,
                  height: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                SvgPicture.asset(
                  icon2,
                  height: 20,
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            color1,
            color2,
          ],
        ),
      ),
    );
  }
}
