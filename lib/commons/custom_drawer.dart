import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return AnimatedSize(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 150),
      child: SizedBox(
        width: isCollapsed == true ? 150 : 300,
        child: Drawer(
          elevation: isCollapsed == true ? 0 : 12,
          child: Container(
            color: _theme.colorScheme.surface,
            child: Column(
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
                                    AssetImage('assets/images/IMG_1959.jpg'),
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
                                "Software Engineering",
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
                              backgroundImage:
                                  AssetImage('assets/images/IMG_1959.jpg'),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Karimul",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
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
                  svgLocation: "assets/svg/home.svg",
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
                  svgLocation: "assets/svg/info-circle.svg",
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
                  svgLocation: "assets/svg/bag.svg",
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
                  svgLocation: "assets/svg/arrow.svg",
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
                  svgLocation: "assets/svg/at.svg",
                  onTap: () {
                    widget.viewmodel.selectedIndex = 3;
                    Get.toNamed("/contactme");
                  },
                  isSelected: widget.viewmodel.selectedIndex == 3,
                  theme: _theme,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(left: 35, top: 20),
                  leading: isCollapsed == true
                      ? SvgPicture.asset(
                          'assets/svg/angle-right.svg',
                          color: _theme.colorScheme.primary,
                          height: 70,
                        )
                      : SvgPicture.asset(
                          'assets/svg/angle-left.svg',
                          color: _theme.colorScheme.primary,
                          height: 70,
                        ),
                  onTap: () {
                    setState(() {
                      isCollapsed = !isCollapsed;
                    });
                  },
                ),
              ],
            ),
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
