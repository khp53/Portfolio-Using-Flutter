import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:portfolio/commons/is_mobileCall.dart';
import 'package:portfolio/screens/portfolio/portfolio_viewmodel.dart';
import 'package:portfolio/screens/portfolio/widgets/motion_portfolio_card.dart';
import 'package:portfolio/screens/portfolio/widgets/portfolio_card.dart';

// ignore: must_be_immutable
class PortfolioBody extends StatelessWidget {
  final PortfolioViewmodel viewmodel;
  final scaffoldKey;
  PortfolioBody({Key? key, required this.viewmodel, this.scaffoldKey})
      : super(key: key);

  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -5, 0);

  ScrollController _controller = ScrollController();
  ScrollController _controller1 = ScrollController();
  ScrollController _controller2 = ScrollController();

  final List portfolioData = [
    {
      'title': "ShunBoi - Audiobook & Stories",
      'color1': Color.fromARGB(255, 24, 165, 252),
      'color2': Color.fromARGB(255, 45, 108, 254),
      'webLink': "https://shunboi.com",
      'gitLink': "",
      'playStore':
          "https://play.google.com/store/apps/details?id=com.shunboi&hl=en&gl=US",
      'icon1': "svg/flutter.svg",
      'icon2': "",
      'index': 0,
      'details':
          'ShunBoi is a bengali audiobook app made using Flutter! It is the first ever complete and feature rich bengali audiobook app made in Bangladesh.',
    },
    {
      'title': "UTM COVID-19 Contact Tracing Application",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "https://utm-covid19-contact-tracing.web.app",
      'gitLink': "https://github.com/khp53/UTM-COVID19-Contact-Tracing-System",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/firebase.svg",
      'index': 1,
      'details':
          'A web and mobile application that allows users to track their contacts with COVID-19 patients. The application is built using Flutter, Firebase and Google Nearby API.',
    },
    {
      'title': "COVID Detector App",
      'color1': Color(0xffe94057),
      'color2': Color(0xfff27121),
      'webLink': "",
      'gitLink': "https://github.com/khp53/COVID-Detector",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/firebase.svg",
      'index': 2,
      'details':
          'A COVID-19 detector app that allows different premises to detect mask on face and check tempreture using a temp sensor and arduino. The app is built using Flutter and Firebase.',
    },
    {
      'title': "Sure Care Services",
      'color1': Color(0xff00b4db),
      'color2': Color(0xff0083b0),
      'webLink': "",
      'gitLink': "",
      'appStore':
          "https://apps.apple.com/my/app/sure-care-services/id1606152939",
      'playStore':
          "https://play.google.com/store/apps/details?id=bd.com.rrad.service.surecare",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/parse-1.svg",
      'index': 3,
      'details':
          'SureCare is an innovative responsive medical services platform that provides medical advisory services to its members.',
    },
    {
      'title': "Sure Care Admin",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "",
      'appStore':
          "https://apps.apple.com/my/app/sure-care-admin-portal/id1605999983",
      'playStore':
          "https://play.google.com/store/apps/details?id=bd.com.rrad.surecare.admin",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/parse-1.svg",
      'index': 4,
      'details':
          'A web and mobile application built for admins of Sure Care Services, to manage the telemedical services. The app is built using Flutter, FCM and Parse server.',
    },
    {
      'title': "Sure Care Reviewer",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "",
      'gitLink': "",
      'appStore':
          "https://apps.apple.com/my/app/sure-care-reviewer-portal/id1606182343",
      'playStore':
          "https://play.google.com/store/apps/details?id=bd.com.rrad.surecare.reviewer",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/parse-1.svg",
      'index': 5,
      'details':
          'A web and mobile application built for reviewers or doctors of Sure Care Services, to review the telemedical requests. The app is built using Flutter, FCM and Parse server.',
    },
    {
      'title': "RRAD Password Manager",
      'color1': Color(0xffe1eec3),
      'color2': Color(0xfff05053),
      'webLink': "",
      'gitLink': "",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/parse-1.svg",
      'index': 6,
      'details':
          'A password manager app that allows users to store their passwords securely. The app is built using Flutter, Parse Server and Google Drive API.',
    },
    {
      'title': "RRAD ERP Management System",
      'color1': Color.fromARGB(255, 22, 77, 80),
      'color2': Color(0xff34e89e),
      'webLink': "https://rrad-erp.web.app",
      'gitLink': "",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/parse-1.svg",
      'index': 7,
      'details':
          'A web application for company admins that allows admins to manage their Employees, resourses, projects, sells, calculates balance sheets, create invoices and many more.',
    },
    {
      'title': "RRAD ERP Mobile App",
      'color1': Color(0xff3494e6),
      'color2': Color(0xffec6ead),
      'webLink': "https://rrad-erp-mobile.web.app",
      'gitLink': "",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/parse-1.svg",
      'index': 8,
      'details':
          'A mobile application for company employees that allows admins to give attendance, apply for leave and edit their informations.',
    },
    {
      'title': "Fingertips",
      'color1': Color(0xffff7e5f),
      'color2': Color(0xfffeb47b),
      'webLink': "",
      'gitLink': "https://github.com/khp53/fingertips",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/firebase.svg",
      'index': 9,
      'details':
          'A mobile application that allows users to give donations to their prefered organizations. The app is built using Flutter, Firebase Rest',
    },
    {
      'title': "Armario, E-Commerce App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/armario-e-commerce-app",
      'icon1': "svg/flutter.svg",
      'icon2': "empty",
      'index': 10,
      'details':
          'An E-Commerce app that allows users to buy and sell products. The app is built using Flutter and Shared Preferences.',
    },
    {
      'title': "TODOs, A Todo List App",
      'color1': Color(0xff4ca1af),
      'color2': Color(0xffc4e0e5),
      'webLink': "",
      'gitLink': "https://github.com/khp53/TODOs-A-to-do-list-app",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/firebase.svg",
      'index': 11,
      'details':
          'A todo list app that allows users to add, edit, delete and mark tasks. The app is built using Flutter.',
    },
    {
      'title': "Shopper, An E-Commerce App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/Shopper-E-Commerce-App",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/firebase.svg",
      'index': 12,
      'details':
          'An E-Commerce app that allows users to buy and sell products. The app is built using Flutter and Firebase.',
    },
    {
      'title': "Chatty! A Chat App",
      'color1': Color(0xff005aa7),
      'color2': Color(0xfffffde4),
      'webLink': "",
      'gitLink': "https://github.com/khp53/Chatty-A-chat-App",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/firebase.svg",
      'index': 13,
      'details':
          'A chat app that allows users to chat with each other. The app is built using Flutter and Firebase.',
    },
  ];

  final List motionData = [
    {
      'title': "Who Are We - Coderdtrust",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xffE50AAA),
      'webLink': "",
    },
    {
      'title': "Digital Jobs Albania",
      'color1': Color(0xff3D71D4),
      'color2': Color(0xff18EBFC),
      'webLink': "https://youtu.be/foopOQUgLuw",
    },
    {
      'title': "Surving Video Series",
      'color1': Color(0xff007991),
      'color2': Color(0xff78ffd6),
      'webLink':
          "https://youtube.com/playlist?list=PLlRx14nDbMR_-M6wq_ol9i-x0Tku2LDA2",
    },
    {
      'title': "Daily Wins - Alexa Skills",
      'color1': Color(0xff8e2de2),
      'color2': Color(0xff4a00e0),
      'webLink':
          "https://www.behance.net/gallery/104721059/Daily-Wins-Alexa-Skills-Explainer-Video",
    },
    {
      'title': "Ion Thrusters Podcast Advertisement",
      'color1': Color(0xff659999),
      'color2': Color(0xfff4791f),
      'webLink':
          "https://www.behance.net/gallery/101250769/Advertisement-For-Podcast-Ion-Thrusters",
    },
    {
      'title': "Shopper, An E-Commerce App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/Shopper-E-Commerce-App",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/firebase.svg",
      'index': 12,
      'details':
          'An E-Commerce app that allows users to buy and sell products. The app is built using Flutter and Firebase.',
    },
    {
      'title': "Chatty! A Chat App",
      'color1': Color(0xff005aa7),
      'color2': Color(0xfffffde4),
      'webLink': "",
      'gitLink': "https://github.com/khp53/Chatty-A-chat-App",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/firebase.svg",
      'index': 13,
      'details':
          'A chat app that allows users to chat with each other. The app is built using Flutter and Firebase.',
    },
  ];

  final List uiData = [
    {
      'title': "FitHobo - App UI",
      'img': "images/ui/u_1.jpg",
    },
    {
      'title': "UniShopr Traveler UI",
      'img': "images/ui/u_4.jpg",
    },
    {
      'title': "RRAD ERP Mobile UI",
      'img': "images/ui/u_3.jpg",
    },
    {
      'title': "Shopper UI Design",
      'img': "images/ui/u_2.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    var _theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        margin: !isMobile(context) ? EdgeInsets.all(40) : EdgeInsets.all(10),
        padding: !isMobile(context) ? EdgeInsets.all(40) : EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              parser.emojify('Portfolio :minidisc:'),
              style: _theme.textTheme.displayMedium,
            ),
            Text(
              "My Projects",
              style: _theme.textTheme.displayLarge,
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              "Development Projects",
              style: _theme.textTheme.displaySmall,
            ),
            Scrollbar(
              controller: _controller,
              thumbVisibility: true,
              child: Container(
                height: 317,
                margin: EdgeInsets.only(bottom: 20),
                child: ListView.builder(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: portfolioData.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      padding: EdgeInsets.only(right: 50, top: 10),
                      child: PortfolioCard(
                        title: portfolioData[index]['title'],
                        color1: portfolioData[index]['color1'],
                        color2: portfolioData[index]['color2'],
                        icon1: portfolioData[index]['icon1'],
                        icon2: portfolioData[index]['icon2'],
                        index: index,
                        viewmodel: viewmodel,
                        webLink: portfolioData[index]['webLink'],
                        gitLink: portfolioData[index]['gitLink'],
                        appStore: portfolioData[index]['appStore'],
                        playStore: portfolioData[index]['playStore'],
                        details: portfolioData[index]['details'],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              "Motion Designs",
              style: _theme.textTheme.displaySmall,
            ),
            Scrollbar(
              controller: _controller1,
              thumbVisibility: true,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                height: 317,
                child: ListView.builder(
                  controller: _controller1,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: motionData.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      padding: EdgeInsets.only(right: 50, top: 10),
                      child: MotionPortfolioCard(
                        title: motionData[index]['title'],
                        color1: motionData[index]['color1'],
                        color2: motionData[index]['color2'],
                        icon1: "svg/adobeaftereffects.svg",
                        icon2: "svg/adobeillustrator.svg",
                        index: index,
                        viewmodel: viewmodel,
                        behanceLink: motionData[index]['webLink'],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              "UI Designs",
              style: _theme.textTheme.displaySmall,
            ),
            Scrollbar(
              controller: _controller2,
              thumbVisibility: true,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                height: 317,
                child: ListView.builder(
                  controller: _controller2,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: uiData.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      padding: EdgeInsets.only(right: 50, top: 10),
                      child: Image(
                        image: AssetImage(
                          uiData[index]['img'],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
