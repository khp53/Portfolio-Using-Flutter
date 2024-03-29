import 'package:flutter/material.dart';
import 'package:portfolio/commons/custom_appbar.dart';
import 'package:portfolio/commons/custom_drawer.dart';
import 'package:portfolio/screens/about_home/about_viewmodel.dart';
import 'package:portfolio/screens/about_home/widgets/about_body.dart';
import 'package:portfolio/screens/view.dart';

class AboutView extends StatelessWidget {
  AboutView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // this is just to check if the web window size is less then or equal to
  // 600, then will show mobile appbar or else will show web app bar
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1000;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewmodel: AboutViewmodel(),
      builder: (context, aViewmdoel, __) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: isMobile(context)
              ? CustomAppbar(
                  openDrawer: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  title: Text(
                    "Home",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              : null,
          drawer: CustomDrawer(context: context, viewmodel: aViewmdoel),
          body: LayoutBuilder(
            builder: (context, constrains) {
              if (constrains.maxWidth > 1000) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDrawer(
                      context: context,
                      viewmodel: aViewmdoel,
                    ),
                    Expanded(
                      flex: 5,
                      child: AboutBody(
                        scaffoldKey: _scaffoldKey,
                        viewmodel: aViewmdoel,
                      ),
                    ),
                  ],
                );
              } else {
                return AboutBody(
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
