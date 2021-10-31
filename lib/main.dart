import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/screens/about_me/about_me_view.dart';
import 'package:portfolio/screens/about_home/about_view.dart';
import 'package:portfolio/screens/portfolio/portfolio_view.dart';
import 'package:portfolio/screens/skills/skills_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Karimul Hasan',
      theme: ThemeData(
        colorScheme: ColorScheme(
          //whole bg of app
          background: Color(0xff2C2C2C),
          brightness: Brightness.dark,
          error: Color(0xffFA204A),
          onBackground: Color(0xffACACAC),
          onError: Colors.white,
          onPrimary: Colors.black,
          // for gradient
          onSecondary: Color(0xff3D71D4),
          // for gradient
          onSurface: Color(0xffFE582D),
          primary: Color(0xff18EBFC),
          primaryVariant: Color(0xffE5DC0A),
          secondary: Color(0xff00EDBF),
          secondaryVariant: Color(0xffE50AAA),
          //only drawer
          surface: Color(0xff242424),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            fontSize: 25,
            color: Color(0xff18EBFC),
          ),
          headline1: TextStyle(
            fontSize: 65,
            color: Color(0xff18EBFC),
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontFamily: 'Courier New',
            fontSize: 20,
            color: Color(0xffE5DC0A),
            fontWeight: FontWeight.bold,
          ),
          headline3: TextStyle(
            fontFamily: 'Courier New',
            fontSize: 20,
            color: Color(0xff00EDBF),
            fontWeight: FontWeight.bold,
          ),
          subtitle1: TextStyle(
            fontFamily: 'Courier New',
            fontSize: 15,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
          ),
          subtitle2: TextStyle(
            fontSize: 18,
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => AboutView()),
        GetPage(name: "/about", page: () => AboutMeView()),
        GetPage(name: "/portfolio", page: () => PortfolioView()),
        GetPage(name: "/skills", page: () => SkillsView()),
      ],
    );
  }
}
