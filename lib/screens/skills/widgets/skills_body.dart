import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:portfolio/screens/skills/skills_viewmodel.dart';
import 'package:timeline_tile/timeline_tile.dart';

class SkillsBody extends StatelessWidget {
  final scaffoldKey;
  final SkillsViewmodel viewmodel;
  SkillsBody({Key? key, this.scaffoldKey, required this.viewmodel})
      : super(key: key);

  // this is just to check if the web window size is less then or equal to
  // 600, then will show mobile appbar or else will show web app bar
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1000;

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    var _theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        margin: isMobile(context) ? EdgeInsets.all(15) : EdgeInsets.all(40),
        padding: isMobile(context) ? EdgeInsets.all(15) : EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              parser.emojify("Skills :toolbox:"),
              style: _theme.textTheme.displayMedium,
            ),
            Text(
              "My Skills & Experience",
              style: _theme.textTheme.displayLarge,
            ),
            SizedBox(
              height: 35,
            ),
            isMobile(context)
                ? _columnLayout(_theme, context)
                : _rowLayout(_theme, context),
          ],
        ),
      ),
    );
  }

  Widget _columnLayout(ThemeData _theme, context) {
    return Container(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Experiences",
                style: _theme.textTheme.displaySmall,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.3,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewmodel.experienceData.length,
                  itemBuilder: (context, i) {
                    return TimelineTile(
                      indicatorStyle:
                          IndicatorStyle(color: _theme.colorScheme.secondary),
                      beforeLineStyle: LineStyle(
                        color: _theme.colorScheme.secondary.withOpacity(0.3),
                        thickness: 3,
                      ),
                      endChild: Container(
                        margin: EdgeInsets.only(bottom: 45, top: 35),
                        child: ListTile(
                          title: DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              fontFamily: '',
                              color: Colors.white,
                            ),
                            child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              animatedTexts: [
                                TyperAnimatedText(
                                  viewmodel.experienceData[i]['title'],
                                )
                              ],
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                viewmodel.experienceData[i]['designation'],
                                style: _theme.textTheme.titleMedium!.copyWith(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                viewmodel.experienceData[i]['time'],
                                style: _theme.textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          SizedBox(
            height: 45,
          ),

          //-----

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Skills",
                style: _theme.textTheme.displaySmall,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.black,
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewmodel.devSkillData.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: _skillBar(
                        _theme,
                        context,
                        title: viewmodel.devSkillData[i]['title'],
                        value: viewmodel.devSkillData[i]['value'],
                        color: viewmodel.devSkillData[i]['color'],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                color: Colors.black,
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewmodel.motionSkillData.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: _skillBar(
                        _theme,
                        context,
                        title: viewmodel.motionSkillData[i]['title'],
                        value: viewmodel.motionSkillData[i]['value'],
                        color: viewmodel.motionSkillData[i]['color'],
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row _rowLayout(ThemeData _theme, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Experiences",
                style: _theme.textTheme.displaySmall,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewmodel.experienceData.length,
                  itemBuilder: (context, i) {
                    return TimelineTile(
                      indicatorStyle:
                          IndicatorStyle(color: _theme.colorScheme.secondary),
                      beforeLineStyle: LineStyle(
                        color: _theme.colorScheme.secondary.withOpacity(0.3),
                        thickness: 3,
                      ),
                      endChild: Container(
                        margin: EdgeInsets.only(bottom: 45, top: 35),
                        child: ListTile(
                          title: DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              fontFamily: '',
                              color: Colors.white,
                            ),
                            child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              animatedTexts: [
                                TyperAnimatedText(
                                  viewmodel.experienceData[i]['title'],
                                  curve: Curves.easeInCubic,
                                  speed: Duration(milliseconds: 40),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                viewmodel.experienceData[i]['designation'],
                                style: _theme.textTheme.titleMedium!.copyWith(
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                viewmodel.experienceData[i]['time'],
                                style: _theme.textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        //-----

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Skills",
                style: _theme.textTheme.displaySmall,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                //height: 500,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewmodel.devSkillData.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: _skillBar(
                        _theme,
                        context,
                        title: viewmodel.devSkillData[i]['title'],
                        value: viewmodel.devSkillData[i]['value'],
                        color: viewmodel.devSkillData[i]['color'],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                //height: 500,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: viewmodel.motionSkillData.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: _skillBar(
                        _theme,
                        context,
                        title: viewmodel.motionSkillData[i]['title'],
                        value: viewmodel.motionSkillData[i]['value'],
                        color: viewmodel.motionSkillData[i]['color'],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Column _skillBar(
    ThemeData _theme,
    context, {
    required String title,
    double? value,
    dynamic color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 8,
          width: MediaQuery.of(context).size.width,
          child: FAProgressBar(
            currentValue: (value! * 100),
            animatedDuration: const Duration(milliseconds: 500),
            progressColor: color,
            backgroundColor: Colors.grey.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
