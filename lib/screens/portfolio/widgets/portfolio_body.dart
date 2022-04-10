import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:portfolio/commons/is_mobileCall.dart';
import 'package:portfolio/screens/portfolio/portfolio_viewmodel.dart';
import 'package:portfolio/screens/portfolio/widgets/motion_portfolio_card.dart';
import 'package:portfolio/screens/portfolio/widgets/portfolio_card.dart';

class PortfolioBody extends StatelessWidget {
  final PortfolioViewmodel viewmodel;
  final scaffoldKey;
  PortfolioBody({Key? key, required this.viewmodel, this.scaffoldKey})
      : super(key: key);

  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -5, 0);

  final List portfolioData = [
    {
      'title': "UTM COVID-19 Contact Tracing Application",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "https://utm-covid19-contact-tracing.web.app",
      'gitLink': "https://github.com/khp53/UTM-COVID19-Contact-Tracing-System",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/firebase.svg",
      'index': 0,
      'details':
          'A web and mobile application that allows users to track their contacts with COVID-19 patients. The application is built using Flutter, Firebase and Google Nearby API.',
    },
    {
      'title': "Shopper, An E-Commerce App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/Shopper-E-Commerce-App",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/firebase.svg",
      'index': 1,
      'details':
          'An E-Commerce app that allows users to buy and sell products. The app is built using Flutter and Firebase.',
    },
    {
      'title': "Chatty! A Chat App",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "",
      'gitLink': "https://github.com/khp53/Chatty-A-chat-App",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/firebase.svg",
      'index': 2,
      'details':
          'A chat app that allows users to chat with each other. The app is built using Flutter and Firebase.',
    },
    {
      'title': "COVID Detector App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/COVID-Detector",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/firebase.svg",
      'index': 3,
      'details':
          'A COVID-19 detector app that allows different premises to detect mask on face and check tempreture using a temp sensor and arduino. The app is built using Flutter and Firebase.',
    },
    {
      'title': "Sure Care Services",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "",
      'gitLink': "",
      'appStore':
          "https://apps.apple.com/my/app/sure-care-services/id1606152939",
      'playStore':
          "https://play.google.com/store/apps/details?id=bd.com.rrad.service.surecare",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/parse-1.svg",
      'index': 4,
      'details':
          'A web and mobile application built for middle income people of Bangladesh, to provide telemedical services to the people. The app is built using Flutter, FCM and Parse server.',
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
      'index': 5,
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
      'index': 6,
      'details':
          'A web and mobile application built for reviewers or doctors of Sure Care Services, to review the telemedical requests. The app is built using Flutter, FCM and Parse server.',
    },
    {
      'title': "RRAD Password Manager",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/parse-1.svg",
      'index': 7,
      'details':
          'A password manager app that allows users to store their passwords securely. The app is built using Flutter, Parse Server and Google Drive API.',
    },
    {
      'title': "RRAD ERP Management System",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "https://rrad-erp.web.app",
      'gitLink': "",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/parse-1.svg",
      'index': 8,
      'details':
          'A web application for company admins that allows admins to manage their Employees, resourses, projects, sells, calculates balance sheets and many more. The app is built using Flutter, Parse Server and few other APIs.',
    },
    {
      'title': "RRAD ERP Mobile App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "https://rrad-erp-mobile.web.app",
      'gitLink': "",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/parse-1.svg",
      'index': 9,
      'details':
          'A mobile application for company employees that allows admins to give attendance, apply for leave and edit their informations. The app is built using Flutter, Parse Server and few other APIs.',
    },
    {
      'title': "Armario, E-Commerce App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/armario-e-commerce-app",
      'icon1': "svg/flutter.svg",
      'icon2': "",
      'index': 10,
      'details':
          'An E-Commerce app that allows users to buy and sell products. The app is built using Flutter and Shared Preferences.',
    },
    {
      'title': "Fingertips",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/fingertips",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/firebase.svg",
      'index': 11,
      'details':
          'A mobile application that allows users to give donations to their prefered organizations. The app is built using Flutter, Firebase Rest',
    },
    {
      'title': "TODOs, A Todo List App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/TODOs-A-to-do-list-app",
      'icon1': "svg/flutter.svg",
      'icon2': "svg/firebase.svg",
      'index': 12,
      'details':
          'A todo list app that allows users to add, edit, delete and mark tasks. The app is built using Flutter.',
    },
  ];

  final List motionData = [
    {
      'title': "Who Are We - Coderdtrust",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xffE50AAA),
      'webLink': "https://",
    },
    {
      'title': "Digital Jobs Albania",
      'color1': Color(0xff3D71D4),
      'color2': Color(0xff18EBFC),
      'webLink': "https://",
    },
    {
      'title': "Surving Video Series",
      'color1': Color(0xff3D71D4),
      'color2': Color(0xff18EBFC),
      'webLink': "https://",
    }
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
              style: _theme.textTheme.headline2,
            ),
            Text(
              "My Projects",
              style: _theme.textTheme.headline1,
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              "Development Projects",
              style: _theme.textTheme.headline3,
            ),
            Container(
              height: 317,
              child: ListView.builder(
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
            SizedBox(
              height: 35,
            ),
            Text(
              "Motion Designs",
              style: _theme.textTheme.headline3,
            ),
            Container(
              height: 317,
              child: ListView.builder(
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
                      behanceLink: portfolioData[index]['webLink'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
