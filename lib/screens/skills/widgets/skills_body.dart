import 'package:flutter/material.dart';
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
      MediaQuery.of(context).size.width <= 1100;

  final List experienceData = [
    {
      'title': 'AIESEC In Malaysia, Johor Bahru',
      'designation': 'Senior Executive',
      'time': 'Feb 2020 - Feb 2021'
    },
    {
      'title': 'Coderstrust Global',
      'designation': 'Video Editor & Motion Designer',
      'time': 'Nov 2020 - Present'
    },
    {
      'title': 'Robust Research & Development',
      'designation': 'Software Engineer & Flutter Developer',
      'time': 'Aug 2021 - Present'
    },
  ];

  final List devSkillData = [
    {
      'title': 'Flutter',
      'value': 0.9,
      'color': Color(0xff18EBFC),
    },
    {
      'title': 'Java',
      'value': 0.7,
      'color': Color(0xff00EDBF),
    },
    {
      'title': 'C++',
      'value': 0.6,
      'color': Color(0xffE5DC0A),
    },
    {
      'title': 'HTML',
      'value': 0.9,
      'color': Color(0xff3D71D4),
    },
    {
      'title': 'CSS',
      'value': 0.7,
      'color': Color(0xff18EBFC),
    },
    {
      'title': 'JavaScript',
      'value': 0.5,
      'color': Color(0xffE5DC0A),
    },
    {
      'title': 'Backend',
      'value': 0.7,
      'color': Color(0xffFE582D),
    },
  ];

  final List motionSkillData = [
    {
      'title': 'Adobe After Effects',
      'value': 0.7,
      'color': Color(0xff18EBFC),
    },
    {
      'title': 'Adobe Illustrator',
      'value': 0.85,
      'color': Color(0xffE50AAA),
    },
    {
      'title': 'Adobe XD',
      'value': 0.9,
      'color': Color(0xff18EBFC),
    },
  ];

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(40),
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Skills 🎯",
              style: _theme.textTheme.headline2,
            ),
            Text(
              "My Skills & Experience",
              style: _theme.textTheme.headline1,
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
                style: _theme.textTheme.headline3,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: experienceData.length,
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
                          title: Text(experienceData[i]['title'],
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                                fontFamily: '',
                                color: Colors.white,
                              )),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                experienceData[i]['designation'],
                                style: _theme.textTheme.subtitle1,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                experienceData[i]['time'],
                                style: _theme.textTheme.subtitle1,
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
            height: 40,
          ),

          //-----

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Skills",
                style: _theme.textTheme.headline3,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.black,
                padding: EdgeInsets.all(20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: devSkillData.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: _skillBar(
                        _theme,
                        context,
                        title: devSkillData[i]['title'],
                        value: devSkillData[i]['value'],
                        color: devSkillData[i]['color'],
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
                  itemCount: motionSkillData.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: _skillBar(
                        _theme,
                        context,
                        title: motionSkillData[i]['title'],
                        value: motionSkillData[i]['value'],
                        color: motionSkillData[i]['color'],
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
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Experiences",
                style: _theme.textTheme.headline3,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: experienceData.length,
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
                          title: Text(experienceData[i]['title'],
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                                fontFamily: '',
                                color: Colors.white,
                              )),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                experienceData[i]['designation'],
                                style: _theme.textTheme.subtitle1,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                experienceData[i]['time'],
                                style: _theme.textTheme.subtitle1,
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
                style: _theme.textTheme.headline3,
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
                  itemCount: devSkillData.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: _skillBar(
                        _theme,
                        context,
                        title: devSkillData[i]['title'],
                        value: devSkillData[i]['value'],
                        color: devSkillData[i]['color'],
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
                  itemCount: motionSkillData.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 15),
                      child: _skillBar(
                        _theme,
                        context,
                        title: motionSkillData[i]['title'],
                        value: motionSkillData[i]['value'],
                        color: motionSkillData[i]['color'],
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
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            child: LinearProgressIndicator(
              backgroundColor: _theme.colorScheme.onBackground.withOpacity(0.6),
              valueColor: AlwaysStoppedAnimation<Color>(
                color,
              ),
              value: value,
            ),
          ),
        ),
      ],
    );
  }
}
