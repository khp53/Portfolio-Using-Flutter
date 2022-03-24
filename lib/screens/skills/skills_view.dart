import 'package:flutter/material.dart';
import 'package:portfolio/commons/custom_appbar.dart';
import 'package:portfolio/commons/custom_drawer.dart';
import 'package:portfolio/screens/skills/skills_viewmodel.dart';
import 'package:portfolio/screens/skills/widgets/skills_body.dart';
import 'package:portfolio/screens/view.dart';

class SkillsView extends StatelessWidget {
  SkillsView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // this is just to check if the web window size is less then or equal to
  // 600, then will show mobile appbar or else will show web app bar
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1000;

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: SkillsViewmodel(),
      builder: (context, sViewmodel, __) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: isMobile(context)
              ? CustomAppbar(
                  openDrawer: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  title: Text(
                    "Skills",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              : null,
          drawer: CustomDrawer(context: context, viewmodel: sViewmodel),
          body: LayoutBuilder(
            builder: (context, constrains) {
              if (constrains.maxWidth > 1000) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDrawer(
                      context: context,
                      viewmodel: sViewmodel,
                    ),
                    Expanded(
                      flex: 5,
                      child: SkillsBody(
                        scaffoldKey: _scaffoldKey,
                        viewmodel: sViewmodel,
                      ),
                    ),
                  ],
                );
              } else {
                return SkillsBody(
                  scaffoldKey: _scaffoldKey,
                  viewmodel: sViewmodel,
                );
              }
            },
          ),
        );
      },
    );
  }
}
