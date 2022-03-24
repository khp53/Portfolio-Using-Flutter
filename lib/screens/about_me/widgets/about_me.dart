import 'package:flutter/material.dart';
import 'package:portfolio/commons/is_mobileCall.dart';
import 'package:portfolio/models/about.dart';
import 'package:portfolio/screens/about_me/about_me_viewmodel.dart';
import 'package:portfolio/screens/stateful_wrapper.dart';
import 'package:rive/rive.dart';

class AboutMe extends StatefulWidget {
  final AboutMeViewmodel? viewmodel;
  final scaffoldKey;
  const AboutMe({Key? key, this.viewmodel, this.scaffoldKey}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> with TickerProviderStateMixin {
  Future<About?> getAboutStuff() {
    return widget.viewmodel!.getAboutStuff();
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return StatefulWrapper(
      onInit: () {
        getAboutStuff().then((value) => widget.viewmodel!.about = value);
      },
      child: SingleChildScrollView(
        child: Container(
          child: isMobile(context)
              ? columnLayout(_theme, context)
              : rowLayout(_theme, context),
        ),
      ),
    );
  }

  Row rowLayout(ThemeData _theme, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(40),
            padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "About MySelf 👨🏻‍💻",
                  style: _theme.textTheme.headline2,
                ),
                Text(
                  "MD Karimul Hasan",
                  style: _theme.textTheme.headline1,
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  child: Text(
                    "Experienced instructor and application developer with a demonstrated history of working in the e-learning and software industry. Skilled in PHP, MySql, Mobile application development using Flutter, Java, Motion Design, Video Editing, Analytical Skills, Statistical Data Analysis. Strong arts and design professional with a Bachelor of Computer Science focused in Software Engineering from Universiti Teknologi Malaysia.",
                    style: _theme.textTheme.bodyText1!.copyWith(fontSize: 25),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: widget.viewmodel!.about != null
                ? RiveAnimation.network(
                    widget.viewmodel!.about!.riveAnimation.url!,
                    placeHolder: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please wait...",
                          style: _theme.textTheme.bodyText1!
                              .copyWith(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Column columnLayout(ThemeData _theme, BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          child: widget.viewmodel!.about != null
              ? RiveAnimation.network(
                  widget.viewmodel!.about!.riveAnimation.url!,
                  placeHolder: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Please wait...",
                        style:
                            _theme.textTheme.bodyText1!.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "About MySelf 👨🏻‍💻",
                style: _theme.textTheme.headline2,
              ),
              Text(
                "MD Karimul Hasan",
                style: _theme.textTheme.headline1,
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: Text(
                  "Experienced instructor and application developer with a demonstrated history of working in the e-learning and software industry. Skilled in PHP, MySql, Mobile application development using Flutter, Java, Motion Design, Video Editing, Analytical Skills, Statistical Data Analysis. Strong arts and design professional with a Bachelor of Computer Science focused in Software Engineering from Universiti Teknologi Malaysia.",
                  style: _theme.textTheme.bodyText1!.copyWith(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
