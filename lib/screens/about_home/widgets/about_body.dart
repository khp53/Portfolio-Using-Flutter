import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/commons/custom_button.dart';
import 'package:portfolio/screens/about_home/about_viewmodel.dart';

class AboutBody extends StatelessWidget {
  final AboutViewmodel viewmodel;
  final scaffoldKey;
  const AboutBody({Key? key, required this.viewmodel, this.scaffoldKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTextStyle(
              style: _theme.textTheme.subtitle1!,
              child: AnimatedTextKit(
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText(
                      "import ‘package:flutter/material.dart’;\n\nclass NotificationView extends StatelessWidget {\n\n    @override\n    Widget build(BuildContext context) {\n        return Container(\n            child: CustomAbout(\n                '")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: _size.width / 9),
              child: RichText(
                text: TextSpan(
                  text: "Hi!\nI'm ",
                  style: TextStyle(
                    fontSize: 75,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "MD Karimul Hasan",
                      style: TextStyle(
                        fontSize: 75,
                        color: _theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\nSoftware Engineer!",
                      style: TextStyle(
                        fontSize: 75,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\nFlutter Developer + Motion Designer!",
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
            ),
            Container(
              padding: EdgeInsets.only(left: _size.width / 12),
              child: DefaultTextStyle(
                style: _theme.textTheme.subtitle1!,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "'\nhireMe:\n",
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: _size.width / 9),
              child: Row(
                children: [
                  CustomButtom(
                    onPressed: () {},
                    text: "Hire Me!",
                    color: _theme.colorScheme.primary,
                    tColor: _theme.colorScheme.primary,
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  CustomButtom(
                    onPressed: () {},
                    text: "Download Resume",
                    color: _theme.colorScheme.secondary,
                    tColor: _theme.colorScheme.secondary,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: _size.width / 12),
              child: DefaultTextStyle(
                style: _theme.textTheme.subtitle1!,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "\n),",
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: _size.width / 17),
              child: DefaultTextStyle(
                style: _theme.textTheme.subtitle1!,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "\n\n);",
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: _size.width / 28),
              child: DefaultTextStyle(
                style: _theme.textTheme.subtitle1!,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "\n\n},",
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: _size.width / 50),
              child: DefaultTextStyle(
                style: _theme.textTheme.subtitle1!,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "\n\n}",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
