import 'package:flutter/material.dart';
import 'package:portfolio/commons/custom_appbar.dart';
import 'package:portfolio/commons/custom_drawer.dart';
import 'package:portfolio/screens/about_me/about_me_viewmodel.dart';
import 'package:portfolio/screens/about_me/widgets/about_me.dart';
import 'package:portfolio/screens/view.dart';

class AboutMeView extends StatelessWidget {
  AboutMeView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // this is just to check if the web window size is less then or equal to
  // 600, then will show mobile appbar or else will show web app bar
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1100;

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: AboutMeViewmodel(),
      builder: (context, aViewmdoel, __) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: isMobile(context)
              ? CustomAppbar(
                  title: Text(
                    "About Me",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  openDrawer: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                )
              : null,
          drawer: CustomDrawer(context: context, viewmodel: aViewmdoel),
          body: LayoutBuilder(
            builder: (context, constrains) {
              if (constrains.maxWidth > 1100) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDrawer(
                      context: context,
                      viewmodel: aViewmdoel,
                    ),
                    Expanded(
                      flex: 5,
                      child: AboutMe(
                        scaffoldKey: _scaffoldKey,
                        viewmodel: aViewmdoel,
                      ),
                    ),
                  ],
                );
              } else {
                return AboutMe(
                  scaffoldKey: _scaffoldKey,
                  viewmodel: aViewmdoel,
                );
              }
            },
          ),
        );
      },
    );
  }
}
