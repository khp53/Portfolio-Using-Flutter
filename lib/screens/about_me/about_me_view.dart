import 'package:flutter/material.dart';
import 'package:portfolio/commons/custom_appbar.dart';
import 'package:portfolio/commons/custom_drawer.dart';
import 'package:portfolio/screens/about_me/about_me_viewmodel.dart';
import 'package:portfolio/screens/about_me/widgets/about_me.dart';
import 'package:portfolio/screens/view.dart';

class AboutMeView extends StatefulWidget {
  AboutMeView({Key? key}) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1100;

  @override
  State<AboutMeView> createState() => _AboutMeViewState();
}

class _AboutMeViewState extends State<AboutMeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: AboutMeViewmodel(),
      builder: (context, aViewmdoel, __) {
        return Scaffold(
            key: _scaffoldKey,
            appBar: AboutMeView.isMobile(context)
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
            body: //_isLoading == false
                LayoutBuilder(
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
            )
            // : Center(
            //     child: CircularProgressIndicator(),
            //   ),
            );
      },
    );
  }
}
