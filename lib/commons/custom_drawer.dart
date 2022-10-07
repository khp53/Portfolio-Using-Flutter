import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class CustomDrawer extends StatefulWidget {
  final viewmodel;
  final context;

  CustomDrawer({Key? key, this.viewmodel, this.context}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isCollapsed = true;
  bool isHovering = false;
  bool isHovering1 = false;
  bool isHovering2 = false;

  String fb = 'https://www.facebook.com/khp53';
  String insta = 'https://www.instagram.com/khp53';
  String linkedin = 'https://www.linkedin.com/in/karimulhasan53/';

  void _launchFBURL() async =>
      await canLaunch(fb) ? await launch(fb) : throw 'Could not launch $fb';

  void _launchIGURL() async => await canLaunch(insta)
      ? await launch(insta)
      : throw 'Could not launch $insta';

  void _launchLinkedInURL() async => await canLaunch(linkedin)
      ? await launch(linkedin)
      : throw 'Could not launch $linkedin';

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: isCollapsed == true ? 150 : 300,
      child: Drawer(
        elevation: isCollapsed == true ? 0 : 12,
        child: Container(
          color: _theme.colorScheme.surface,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Color(0xff242424)),
                child: isCollapsed
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  AssetImage('images/IMG_1959.jpg'),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Karimul",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Software Engineer",
                              style: TextStyle(
                                  color: _theme.colorScheme.onBackground,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage('images/IMG_1959.jpg'),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Karimul",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Software Engineering",
                                style: TextStyle(
                                    color: _theme.colorScheme.onBackground,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          )
                        ],
                      ),
              ),
              _buildListTile(
                context,
                text: 'Home',
                svgLocation: "svg/home.svg",
                onTap: () {
                  widget.viewmodel.selectedIndex = 0;
                  Get.toNamed("/");
                },
                isSelected: widget.viewmodel.selectedIndex == 0,
                theme: _theme,
              ),
              _buildListTile(
                context,
                text: 'About',
                svgLocation: "svg/info-circle.svg",
                onTap: () {
                  widget.viewmodel.selectedIndex = 1;
                  Get.toNamed("/about");
                },
                isSelected: widget.viewmodel.selectedIndex == 1,
                theme: _theme,
              ),
              _buildListTile(
                context,
                text: 'Portfolio',
                svgLocation: "svg/bag.svg",
                onTap: () {
                  widget.viewmodel.selectedIndex = 2;
                  Get.toNamed("/portfolio");
                },
                isSelected: widget.viewmodel.selectedIndex == 2,
                theme: _theme,
              ),
              _buildListTile(
                context,
                text: 'Skills',
                svgLocation: "svg/arrow.svg",
                onTap: () {
                  widget.viewmodel.selectedIndex = 3;
                  Get.toNamed("/skills");
                },
                isSelected: widget.viewmodel.selectedIndex == 3,
                theme: _theme,
              ),
              _buildListTile(
                context,
                text: 'Contact Me',
                svgLocation: "svg/at.svg",
                onTap: () {
                  widget.viewmodel.selectedIndex = 4;
                  Get.toNamed("/contactme");
                },
                isSelected: widget.viewmodel.selectedIndex == 4,
                theme: _theme,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(left: 35, top: 20),
                leading: isCollapsed == true
                    ? SvgPicture.asset(
                        'svg/angle-right.svg',
                        color: _theme.colorScheme.primary,
                        height: 70,
                      )
                    : SvgPicture.asset(
                        'svg/angle-left.svg',
                        color: _theme.colorScheme.primary,
                        height: 70,
                      ),
                onTap: () {
                  setState(() {
                    isCollapsed = !isCollapsed;
                  });
                },
              ),
              SizedBox(
                height: 30,
              ),
              // facebook
              MouseRegion(
                onEnter: (event) => setState(() {
                  isHovering = true;
                }),
                onExit: (event) => setState(() {
                  isHovering = false;
                }),
                child: ListTile(
                  contentPadding: EdgeInsets.only(
                    left: 60,
                  ),
                  onTap: () {
                    kIsWeb ? html.window.open(fb, "FB Link") : _launchFBURL();
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.facebook,
                    color: isHovering
                        ? Color.fromARGB(255, 13, 141, 246)
                        : Colors.white,
                    size: 25,
                  ),
                ),
              ),

              // instagram
              MouseRegion(
                onEnter: (event) => setState(() {
                  isHovering1 = true;
                }),
                onExit: (event) => setState(() {
                  isHovering1 = false;
                }),
                child: ListTile(
                  contentPadding: EdgeInsets.only(
                    left: 60,
                  ),
                  onTap: () {
                    kIsWeb
                        ? html.window.open(insta, "IG Link")
                        : _launchIGURL();
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.instagram,
                    color: isHovering1 ? Colors.pinkAccent : Colors.white,
                    size: 25,
                  ),
                ),
              ),

              // linkedin
              MouseRegion(
                onEnter: (event) => setState(() {
                  isHovering2 = true;
                }),
                onExit: (event) => setState(() {
                  isHovering2 = false;
                }),
                child: ListTile(
                  contentPadding: EdgeInsets.only(
                    left: 60,
                  ),
                  onTap: () {
                    kIsWeb
                        ? html.window.open(linkedin, "In Link")
                        : _launchLinkedInURL();
                  },
                  leading: FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: isHovering2
                        ? Color.fromARGB(255, 74, 138, 247)
                        : Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {String? text,
      String? svgLocation,
      GestureTapCallback? onTap,
      h,
      bool? isSelected,
      theme}) {
    return isCollapsed == false
        ? ListTile(
            contentPadding: EdgeInsets.only(left: 60, top: 20),
            selected: true,
            title: Container(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                text!,
                style: TextStyle(
                  color: isSelected!
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onBackground,
                  fontSize: 22,
                  fontFamily: '',
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            onTap: onTap,
            leading: SvgPicture.asset(
              svgLocation!,
              height: h,
              width: 42,
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onBackground,
            ),
          )
        : ListTile(
            contentPadding: EdgeInsets.only(left: 50, top: 20),
            selected: true,
            onTap: onTap,
            leading: Container(
              child: SvgPicture.asset(
                svgLocation!,
                height: h,
                width: 42,
                color: isSelected!
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onBackground,
              ),
            ),
          );
  }
}
