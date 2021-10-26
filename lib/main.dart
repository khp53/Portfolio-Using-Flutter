import 'package:flutter/material.dart';
import 'package:portfolio/screens/about/about_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            color: Theme.of(context).colorScheme.primary,
          ),
          headline1: TextStyle(
            fontSize: 65,
            color: Theme.of(context).colorScheme.primary,
          ),
          headline2: TextStyle(
            fontFamily: 'Courier New',
            fontSize: 25,
            color: Theme.of(context).colorScheme.primaryVariant,
          ),
          headline3: TextStyle(
            fontFamily: 'Courier New',
            fontSize: 25,
            color: Theme.of(context).colorScheme.secondary,
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
      home: AboutView(),
    );
  }
}
