import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final openDrawer;
  final title;
  const CustomAppbar({
    Key? key,
    this.openDrawer,
    this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: IconButton(
        onPressed: openDrawer,
        icon: Icon(Icons.menu),
      ),
    );
  }
}
