import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/commons/custom_button.dart';
import 'package:portfolio/commons/is_mobileCall.dart';
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
        margin: isMobile(context) ? EdgeInsets.all(20) : EdgeInsets.all(40),
        width: _size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "import ‘package:flutter/material.dart’;\n\nclass NotificationView extends StatelessWidget {\n\n    @override\n    Widget build(BuildContext context) {\n        return Container(\n            child: CustomAbout(\n                '",
              style: _theme.textTheme.subtitle1!,
            ),
            Container(
              padding: EdgeInsets.only(left: _size.width / 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi!",
                    style: TextStyle(
                      fontSize: isMobile(context) ? 55 : 75,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Wrap(
                    children: [
                      Text(
                        "I am ",
                        style: TextStyle(
                          fontSize: isMobile(context) ? 55 : 75,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      DefaultTextStyle(
                        style: TextStyle(
                          fontSize: isMobile(context) ? 55 : 75,
                          color: viewmodel.changeColor == false
                              ? _theme.colorScheme.primary
                              : _theme.colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                        child: AnimatedTextKit(
                          isRepeatingAnimation: false,
                          onTap: () {
                            viewmodel.changeColor = !viewmodel.changeColor;
                          },
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'MD Karimul Hasan',
                              speed: const Duration(milliseconds: 120),
                              cursor: '|',
                              curve: Curves.easeInCubic,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Software Engineer!",
                    style: TextStyle(
                      fontSize: isMobile(context) ? 55 : 75,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Flutter Developer + Motion Designer!",
                    style: TextStyle(
                      letterSpacing: 2,
                      height: !isMobile(context) ? 3 : 2,
                      fontSize: 20,
                      fontFamily: 'Courier New',
                      fontWeight: FontWeight.bold,
                      color: viewmodel.changeColor == false
                          ? _theme.colorScheme.secondary
                          : _theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: _size.width / 12),
              child: DefaultTextStyle(
                style: _theme.textTheme.subtitle1!,
                child: Text("'\nhireMe:\n"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: _size.width / 9),
              child: !isMobile(context)
                  ? Row(
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
                    )
                  : Column(
                      children: [
                        CustomButtom(
                          onPressed: () {},
                          text: "Hire Me!",
                          color: _theme.colorScheme.primary,
                          tColor: _theme.colorScheme.primary,
                        ),
                        SizedBox(
                          height: 35,
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
                child: Text("\n),"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: _size.width / 17),
              child: DefaultTextStyle(
                style: _theme.textTheme.subtitle1!,
                child: Text("\n\n);"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: _size.width / 28),
              child: DefaultTextStyle(
                style: _theme.textTheme.subtitle1!,
                child: Text("\n\n},"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: _size.width / 50),
              child: DefaultTextStyle(
                style: _theme.textTheme.subtitle1!,
                child: Text("\n\n}"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
