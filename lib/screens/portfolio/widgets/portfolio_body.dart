import 'package:flutter/material.dart';
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
      'index': 0,
    },
    {
      'title': "Shopper, An E-Commerce App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/Shopper-E-Commerce-App",
      'index': 1,
    },
    {
      'title': "Chatty! A Chat App",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "",
      'gitLink': "https://github.com/khp53/Chatty-A-chat-App",
      'index': 0,
    },
    {
      'title': "COVID Detector App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/COVID-Detector",
      'index': 1,
    },
    {
      'title': "Sure Care Services",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "",
      'gitLink': "",
      'index': 0,
    },
    {
      'title': "Sure Care Admin",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "",
      'index': 1,
    },
    {
      'title': "Sure Care Reviewer",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "",
      'gitLink': "",
      'index': 0,
    },
    {
      'title': "RRAD Password Manager",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "",
      'index': 1,
    },
    {
      'title': "RRAD ERP Management System",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "https://rrad-erp.web.app",
      'gitLink': "",
    },
    {
      'title': "RRAD ERP Mobile App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "https://rrad-erp-mobile.web.app",
      'gitLink': "",
    },
    {
      'title': "Armario, E-Commerce App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/armario-e-commerce-app",
    },
    {
      'title': "Fingertips",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/fingertips",
    },
    {
      'title': "TODOs, A Todo List App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/TODOs-A-to-do-list-app",
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
    var _theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        margin: !isMobile(context) ? EdgeInsets.all(40) : EdgeInsets.all(10),
        padding: !isMobile(context) ? EdgeInsets.all(40) : EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Portfolio 📂",
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
                      icon1: "svg/flutter.svg",
                      icon2: "svg/firebase.svg",
                      index: index,
                      viewmodel: viewmodel,
                      webLink: portfolioData[index]['webLink'],
                      gitLink: portfolioData[index]['gitLink'],
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
