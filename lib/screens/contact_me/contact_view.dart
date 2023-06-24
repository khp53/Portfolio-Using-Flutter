import 'package:flutter/material.dart';
import 'package:portfolio/commons/custom_appbar.dart';
import 'package:portfolio/commons/custom_drawer.dart';
import 'package:portfolio/commons/is_mobileCall.dart';
import 'package:portfolio/screens/contact_me/contact_viewmodel.dart';
import 'package:portfolio/screens/contact_me/widgets/contact_body.dart';
import 'package:portfolio/screens/view.dart';

class ContactMeView extends StatelessWidget {
  ContactMeView({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: ContactMeViewmodel(),
      builder: (context, aViewmdoel, __) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: isMobile(context)
              ? CustomAppbar(
                  openDrawer: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  title: Text(
                    "Contact Me",
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
                      child: ContactBody(
                        //scaffoldKey: _scaffoldKey,
                        viewmodel: aViewmdoel,
                      ),
                    ),
                  ],
                );
              } else {
                return ContactBody(
                  //scaffoldKey: _scaffoldKey,
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
