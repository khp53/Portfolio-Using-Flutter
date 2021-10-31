import 'package:flutter/material.dart';
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
      'title': "UTM COVID-19 Contact Tracing Application",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "https://utm-covid19-contact-tracing.web.app",
      'gitLink': "https://github.com/khp53/UTM-COVID19-Contact-Tracing-System",
    },
    {
      'title': "Shopper, An E-Commerce App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/Shopper-E-Commerce-App",
    },
  ];
  final List motionData = [
    {
      'title': "Who Are We - Coderdtrust",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xffE50AAA),
      'webLink': "https://utm-covid19-contact-tracing.web.app",
    },
    {
      'title': "Digital Jobs Albania",
      'color1': Color(0xff3D71D4),
      'color2': Color(0xff18EBFC),
      'webLink': "",
    }
  ];

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(40),
        padding: EdgeInsets.all(40),
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
                      icon1: "assets/svg/flutter.svg",
                      icon2: "assets/svg/firebase.svg",
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
                      icon1: "assets/svg/adobeaftereffects.svg",
                      icon2: "assets/svg/adobeillustrator.svg",
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
