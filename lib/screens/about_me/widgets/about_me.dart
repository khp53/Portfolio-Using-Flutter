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
                  "Master of Computer Science",
                  style: _theme.textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Memorial University of Newfoundland",
                  style: _theme.textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "St. John's, NL, Canada",
                  style: _theme.textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Bachelor of Computer Science (Software Engineering)",
                  style: _theme.textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Universiti Teknologi Malaysia",
                  style: _theme.textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "Johor, Malaysia",
                  style: _theme.textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.withOpacity(0.7),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  child: Text(
                    """As a highly skilled Flutter Developer and Software Engineer with 3 years of industry experience, I have a proven track record of delivering high-quality, scalable software solutions to meet the needs of clients across a variety of industries. With a deep knowledge of the Flutter framework, I am able to design and develop mobile applications that are both visually stunning and highly functional. My expertise extends to all aspects of computer science and the software development lifecycle, from requirements gathering, choosing methodologies and architecting to coding, testing, and deployment. I am committed to staying up-to-date with the latest industry trends and technologies, and I am always looking for ways to improve my skills and knowledge. Whether working independently or as part of a team, I am dedicated to delivering exceptional results on time. I am a strong communicator who is able to work closely with clients and stakeholders to ensure that their needs are fully met.""",
                    style: _theme.textTheme.bodyLarge!.copyWith(fontSize: 25),
                    textAlign: TextAlign.justify,
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
                "Bachelor of Computer Science (Software Engineering)",
                style: _theme.textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                "Universiti Teknologi Malaysia",
                style: _theme.textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
              Text(
                "Johor, Malaysia",
                style: _theme.textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.withOpacity(0.7),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                child: Text(
                  """As a highly skilled Flutter Developer and Software Engineer with 3 years of industry experience, I have a proven track record of delivering high-quality, scalable software solutions to meet the needs of clients across a variety of industries. With a deep knowledge of the Flutter framework, I am able to design and develop mobile applications that are both visually stunning and highly functional. My expertise extends to all aspects of computer science and the software development lifecycle, from requirements gathering, choosing methodologies and architecting to coding, testing, and deployment. I am committed to staying up-to-date with the latest industry trends and technologies, and I am always looking for ways to improve my skills and knowledge. Whether working independently or as part of a team, I am dedicated to delivering exceptional results on time. I am a strong communicator who is able to work closely with clients and stakeholders to ensure that their needs are fully met.""",
                  style: _theme.textTheme.bodyLarge!.copyWith(fontSize: 25),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
