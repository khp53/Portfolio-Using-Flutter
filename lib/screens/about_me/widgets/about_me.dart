import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
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
    var parser = EmojiParser();
    var _theme = Theme.of(context);
    return StatefulWrapper(
      onInit: () {
        getAboutStuff().then((value) => widget.viewmodel!.about = value);
      },
      child: SingleChildScrollView(
        child: Container(
          child: isMobile(context)
              ? columnLayout(_theme, context, parser)
              : rowLayout(_theme, context, parser),
        ),
      ),
    );
  }

  Row rowLayout(ThemeData _theme, BuildContext context, parser) {
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
                  parser.emojify('About Me :technologist:'),
                  style: _theme.textTheme.displayMedium,
                ),
                Text(
                  "MD Karimul Hasan",
                  style: _theme.textTheme.displayLarge,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Bachelor of Computer Science (Software Engineering)\nUniversiti Teknologi Malaysia\nJohor, Malaysia",
                  style: _theme.textTheme.displayMedium!.copyWith(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  child: Text(
                    "Experienced instructor and application developer with a demonstrated history of working in the e-learning and software industry. Skilled in PHP, MySql, Mobile application development using Flutter, Java, Motion Design, Video Editing, Analytical Skills, Statistical Data Analysis. Strong arts and design professional with a Bachelor of Computer Science focused in Software Engineering from Universiti Teknologi Malaysia.",
                    style: _theme.textTheme.bodyLarge!.copyWith(fontSize: 25),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Loading animation...",
                            style: _theme.textTheme.bodyLarge!
                                .copyWith(fontSize: 20),
                          ),
                        ],
                      ),
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
                          style: _theme.textTheme.bodyLarge!
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

  Column columnLayout(ThemeData _theme, BuildContext context, parser) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2,
          child: widget.viewmodel!.about != null
              ? RiveAnimation.network(
                  widget.viewmodel!.about!.riveAnimation.url!,
                  placeHolder: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Loading animation...",
                          style: _theme.textTheme.bodyLarge!
                              .copyWith(fontSize: 20),
                        ),
                      ],
                    ),
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
                            _theme.textTheme.bodyLarge!.copyWith(fontSize: 20),
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
                parser.emojify('About Me :technologist:'),
                style: _theme.textTheme.displayMedium,
              ),
              Text(
                "MD Karimul Hasan",
                style: _theme.textTheme.displayLarge,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Bachelor of Computer Science (Software Engineering)\nUniversiti Teknologi Malaysia\nJohor, Malaysia",
                style: _theme.textTheme.displayMedium!.copyWith(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: Text(
                  "Experienced instructor and application developer with a demonstrated history of working in the e-learning and software industry. Skilled in PHP, MySql, Mobile application development using Flutter, Java, Motion Design, Video Editing, Analytical Skills, Statistical Data Analysis. Strong arts and design professional with a Bachelor of Computer Science focused in Software Engineering from Universiti Teknologi Malaysia.",
                  style: _theme.textTheme.bodyLarge!.copyWith(fontSize: 25),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
