import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class CustomDrawer extends StatelessWidget {
  final viewmodel;

  bool isCollapsed = true;

  CustomDrawer({Key? key, this.viewmodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: isCollapsed
                ? Column(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person),
                      ),
                      Text("Karimul"),
                      Text("Software Engineering"),
                    ],
                  )
                : Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person),
                      ),
                      Column(
                        children: [
                          Text("Karimul"),
                          Text("Software Engineering"),
                        ],
                      )
                    ],
                  ),
          ),
          _buildListTile(
            context,
            text: 'About',
            svgLocation: "assets/ui_elements/payments.svg",
            onTap: () {
              viewmodel.selectedIndex = 0;
              Get.toNamed("/about");
            },
            isSelected: viewmodel.selectedIndex == 0,
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {String? text,
      String? svgLocation,
      GestureTapCallback? onTap,
      h,
      bool? isSelected}) {
    return isCollapsed == false
        ? Ink(
            color: isSelected!
                ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
                : Colors.transparent,
            child: ListTile(
              selected: true,
              title: Text(
                text!,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onTap: onTap,
              leading: SvgPicture.asset(
                svgLocation!,
                height: h,
                width: 20,
              ),
            ),
          )
        : Ink(
            color: isSelected!
                ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
                : Colors.transparent,
            child: ListTile(
              selected: true,
              onTap: onTap,
              leading: SvgPicture.asset(
                svgLocation!,
                height: h,
                width: 20,
              ),
            ),
          );
  }
}
