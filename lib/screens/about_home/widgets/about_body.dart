import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/commons/custom_button.dart';
import 'package:portfolio/commons/is_mobileCall.dart';
import 'package:portfolio/models/download_resume.dart';
import 'package:portfolio/screens/about_home/about_viewmodel.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:portfolio/screens/stateful_wrapper.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutBody extends StatelessWidget {
  final AboutViewmodel viewmodel;
  final scaffoldKey;
  const AboutBody({Key? key, required this.viewmodel, this.scaffoldKey})
      : super(key: key);

  void downloadFile(String url) {
    html.AnchorElement anchorElement = new html.AnchorElement(href: url);
    anchorElement.target = "_blank";
    anchorElement.download = url;
    anchorElement.click();
  }

  Future<Resume?> getResume(AboutViewmodel viewmodel) async {
    return await viewmodel.getResume();
  }

  void _launchURL() async {
    if (!await launchUrl(Uri.parse("mailto:karimulhasan1998@gmail.com")))
      throw 'Could not launch email';
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    var _size = MediaQuery.of(context).size;
    return StatefulWrapper(
      onInit: () {
        getResume(viewmodel).then((value) {
          viewmodel.resume = value;
          //print(viewmodel.resume);
        });
      },
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: isMobile(context) ? EdgeInsets.all(20) : EdgeInsets.all(40),
            width: _size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "import ‘package:flutter/material.dart’;\n\nclass PortfolioView extends StatelessWidget {\n\n    @override\n    Widget build(BuildContext context) {\n        return Container(\n            child: CustomAbout(\n                '",
                  style: _theme.textTheme.titleMedium!,
                ),
                Container(
                  padding: EdgeInsets.only(left: _size.width / 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi!",
                        style: TextStyle(
                          fontSize: isMobile(context) ? 35 : 75,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Wrap(
                        children: [
                          Text(
                            "I am ",
                            style: TextStyle(
                              fontSize: isMobile(context) ? 35 : 75,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'MD Karimul Hasan',
                            style: TextStyle(
                              fontSize: isMobile(context) ? 35 : 75,
                              color: viewmodel.changeColor == false
                                  ? _theme.colorScheme.primary
                                  : _theme.colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: isMobile(context) ? 60 : 100,
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: isMobile(context) ? 28 : 75,
                            color: _theme.colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                          child: AnimatedTextKit(
                            isRepeatingAnimation: true,
                            repeatForever: true,
                            animatedTexts: [
                              RotateAnimatedText(
                                "Software Engineer",
                                alignment: Alignment.centerLeft,
                                duration: const Duration(milliseconds: 1500),
                              ),
                              RotateAnimatedText(
                                "Flutter Developer",
                                alignment: Alignment.centerLeft,
                                duration: const Duration(milliseconds: 1500),
                              ),
                              RotateAnimatedText(
                                "Motion Designer",
                                alignment: Alignment.centerLeft,
                                duration: const Duration(milliseconds: 1500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: _size.width / 12),
                  child: DefaultTextStyle(
                    style: _theme.textTheme.titleMedium!,
                    child: Text("'\nhireMe:\n"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: _size.width / 9),
                  child: !isMobile(context)
                      ? Row(
                          children: [
                            CustomButtom(
                              onPressed: () {
                                _launchURL();
                              },
                              text: "Email Me!",
                              color: _theme.colorScheme.primary,
                              tColor: _theme.colorScheme.primary,
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            CustomButtom(
                              onPressed: () {
                                downloadFile(viewmodel.resume!.resume.url!);
                              },
                              text: "Download Resume",
                              color: _theme.colorScheme.secondary,
                              tColor: _theme.colorScheme.secondary,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            CustomButtom(
                              onPressed: () {
                                _launchURL();
                              },
                              text: "Email Me!",
                              color: _theme.colorScheme.primary,
                              tColor: _theme.colorScheme.primary,
                            ),
                            SizedBox(
                              height: 35,
                            ),
                            CustomButtom(
                              onPressed: () {
                                downloadFile(viewmodel.resume!.resume.url!);
                              },
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
                    style: _theme.textTheme.titleMedium!,
                    child: Text("\n),"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: _size.width / 17),
                  child: DefaultTextStyle(
                    style: _theme.textTheme.titleMedium!,
                    child: Text("\n\n);"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: _size.width / 28),
                  child: DefaultTextStyle(
                    style: _theme.textTheme.titleMedium!,
                    child: Text("\n\n},"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: _size.width / 50),
                  child: DefaultTextStyle(
                    style: _theme.textTheme.titleMedium!,
                    child: Text("\n\n}"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
