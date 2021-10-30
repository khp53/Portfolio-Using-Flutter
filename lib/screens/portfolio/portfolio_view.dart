import 'package:flutter/material.dart';
import 'package:portfolio/commons/custom_appbar.dart';
import 'package:portfolio/commons/custom_drawer.dart';
import 'package:portfolio/screens/portfolio/portfolio_viewmodel.dart';
import 'package:portfolio/screens/portfolio/widgets/portfolio_body.dart';
import 'package:portfolio/screens/view.dart';

class PortfolioView extends StatelessWidget {
  PortfolioView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // this is just to check if the web window size is less then or equal to
  // 600, then will show mobile appbar or else will show web app bar
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1100;

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: PortfolioViewmodel(),
      builder: (context, pViewmdoel, __) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: isMobile(context)
              ? CustomAppbar(
                  openDrawer: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                )
              : null,
          drawer: CustomDrawer(context: context, viewmodel: pViewmdoel),
          body: LayoutBuilder(
            builder: (context, constrains) {
              if (constrains.maxWidth > 1100) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDrawer(
                      context: context,
                      viewmodel: pViewmdoel,
                    ),
                    Expanded(
                      flex: 5,
                      child: PortfolioBody(
                        scaffoldKey: _scaffoldKey,
                        viewmodel: pViewmdoel,
                      ),
                    ),
                  ],
                );
              } else {
                return PortfolioBody(
                  scaffoldKey: _scaffoldKey,
                  viewmodel: pViewmdoel,
                );
              }
            },
          ),
        );
      },
    );
  }
}
