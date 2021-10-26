import 'package:flutter/material.dart';
import 'package:portfolio/screens/about/about_viewmodel.dart';

class AboutBody extends StatelessWidget {
  final AboutViewmodel viewmodel;
  final scaffoldKey;
  const AboutBody({Key? key, required this.viewmodel, this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "import ‘package:flutter/material.dart’;\n\nclass NotificationView extends StatelessWidget {\n\n    @override\n    Widget build(BuildContext context) {\n        return Container(\n            child: CustomAbout(\n                '",
            style: _theme.textTheme.subtitle1,
          ),
          RichText(
            text: TextSpan(
              text: "        Hi!\n        I'm",
              style: TextStyle(
                fontSize: 75,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: " MD Karimul Hasan",
                  style: TextStyle(
                    fontSize: 75,
                    color: _theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "\n        Software Engineer!",
                  style: TextStyle(
                    fontSize: 75,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "\n           Flutter Developer + Motion Designer!",
                  style: TextStyle(
                    letterSpacing: 2,
                    height: 5,
                    fontSize: 20,
                    fontFamily: 'Courier New',
                    fontWeight: FontWeight.bold,
                    color: _theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
