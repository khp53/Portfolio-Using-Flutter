import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:portfolio/screens/about_me/about_me_view.dart';
import 'package:portfolio/screens/about_home/about_view.dart';
import 'package:portfolio/screens/contact_me/contact_view.dart';
import 'package:portfolio/screens/portfolio/portfolio_view.dart';
import 'package:portfolio/screens/portfolio/widgets/portfolio_details.dart';
import 'package:portfolio/screens/skills/skills_view.dart';
import 'package:portfolio/dependencies/dependencies.dart' as di;
import 'package:url_strategy/url_strategy.dart';

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'FCpIjDyKR2yX8YxIxWYNhDK1GuigyZN3MlnGcTTt';
  final keyClientKey = 'eyCAidUJUHqNFoVHEjeV2SKKX8ItQF4wAmLfDWyl';
  final keyParseServerUrl = 'https://parseapi.back4app.com';
  await Parse().initialize(
    keyApplicationId,
    keyParseServerUrl,
    clientKey: keyClientKey,
    debug: false,
    autoSendSessionId: true,
    liveQueryUrl: keyParseServerUrl,
  );
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      title: 'Karimul Hasan',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme(
          //whole bg of app
          background: Color(0xff242424),
          brightness: Brightness.dark,
          error: Color(0xffFA204A),
          onBackground: Color(0xffACACAC),
          onError: Colors.white,
          onPrimary: Colors.black,
          // for gradient
          onSecondary: Color(0xff3D71D4),
          // for gradient
          onSurface: Color(0xff18EBFC),
          primary: Color(0xff18EBFC),
          secondary: Color(0xff00EDBF),
          //only drawer
          surface: Color(0xff242424),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 25,
            color: Color(0xff18EBFC),
          ),
          displayLarge: TextStyle(
            fontSize: 65,
            color: Color(0xff18EBFC),
            fontWeight: FontWeight.bold,
          ),
          displayMedium: TextStyle(
            fontFamily: 'Courier New',
            fontSize: 20,
            color: Color(0xffE5DC0A),
            fontWeight: FontWeight.bold,
          ),
          displaySmall: TextStyle(
            fontFamily: 'Courier New',
            fontSize: 20,
            color: Color(0xff00EDBF),
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontFamily: 'Courier New',
            fontSize: 15,
            color: Color(0xffACACAC).withOpacity(0.5),
          ),
          titleSmall: TextStyle(
            fontSize: 18,
            color: Color(0xffACACAC),
          ),
        ),
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => AboutView()),
        GetPage(name: "/about", page: () => AboutMeView()),
        GetPage(name: "/portfolio", page: () => PortfolioView()),
        GetPage(name: "/portfolio/details/", page: () => PortfolioDetails()),
        GetPage(name: "/skills", page: () => SkillsView()),
        GetPage(name: "/contactme", page: () => ContactMeView()),
      ],
    );
  }
}
