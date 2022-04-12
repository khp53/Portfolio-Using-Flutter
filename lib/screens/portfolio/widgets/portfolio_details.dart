import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:get/get.dart';
import 'package:portfolio/commons/custom_appbar.dart';
import 'package:portfolio/commons/custom_drawer.dart';
import 'package:portfolio/commons/is_mobileCall.dart';
import 'package:portfolio/screens/portfolio/portfolio_viewmodel.dart';
import 'package:portfolio/screens/view.dart';

class PortfolioDetails extends StatefulWidget {
  PortfolioDetails({Key? key}) : super(key: key);

  @override
  State<PortfolioDetails> createState() => _PortfolioDetailsState();
}

class _PortfolioDetailsState extends State<PortfolioDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String? index = Get.parameters['id'];

  final List portfolioData = [
    {
      'title': "UTM COVID-19 Contact Tracing Application",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "https://utm-covid19-contact-tracing.web.app",
      'gitLink': "https://github.com/khp53/UTM-COVID19-Contact-Tracing-System",
      'index': 0,
      'details':
          'A web and mobile application that allows users to track their contacts with COVID-19 patients. The application is built using Flutter, Firebase and Google Nearby API.',
      'images': [
        'images/utmccta/1.png',
        'images/utmccta/2.png',
        'images/utmccta/3.png',
        'images/utmccta/4.png',
        'images/utmccta/5.png',
        'images/utmccta/6.png',
        'images/utmccta/7.png',
        'images/utmccta/8.png',
        'images/utmccta/9.png',
        'images/utmccta/10.png',
      ],
      'images2': [
        'images/utmccta/1web.png',
        'images/utmccta/2web.png',
        'images/utmccta/3web.png',
        'images/utmccta/4web.png',
        'images/utmccta/5web.png',
        'images/utmccta/6web.png',
        'images/utmccta/7web.png',
        'images/utmccta/8web.png',
        'images/utmccta/9web.png',
      ],
    },
    {
      'title': "Shopper, An E-Commerce App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/Shopper-E-Commerce-App",
      'index': 1,
      'details':
          'An E-Commerce app that allows users to buy and sell products. The app is built using Flutter and Firebase.',
      'images': [
        'images/shopper/ss10.png',
        'images/shopper/ss11.png',
        'images/shopper/ss1.png',
        'images/shopper/ss2.png',
        'images/shopper/ss4.png',
        'images/shopper/ss9.png',
        'images/shopper/ss3.png',
        'images/shopper/ss6.png',
        'images/shopper/ss7.png',
        'images/shopper/ss8.png',
        'images/shopper/ss5.png',
      ],
    },
    {
      'title': "Chatty! A Chat App",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "",
      'gitLink': "https://github.com/khp53/Chatty-A-chat-App",
      'index': 2,
      'details':
          'A chat app that allows users to chat with each other. The app is built using Flutter and Firebase.',
      'images': [
        'images/chatty/1.png',
        'images/chatty/2.png',
        'images/chatty/3.png',
        'images/chatty/4.png',
        'images/chatty/5.png',
        'images/chatty/6.png',
        'images/chatty/7.png',
        'images/chatty/8.png',
        'images/chatty/9.png',
        'images/chatty/10.png',
      ],
    },
    {
      'title': "COVID Detector App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/COVID-Detector",
      'index': 3,
      'details':
          'A COVID-19 detector app that allows different premises to detect mask on face and check tempreture using a temp sensor and arduino. The app is built using Flutter and Firebase.',
      'images': [
        'images/coviddetector/1.png',
        'images/coviddetector/2.png',
        'images/coviddetector/3.png',
        'images/coviddetector/4.png',
        'images/coviddetector/5.png',
        'images/coviddetector/6.png',
        'images/coviddetector/7.png',
        'images/coviddetector/8.png',
        'images/coviddetector/9.png',
      ],
    },
    {
      'title': "Sure Care Services",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "",
      'gitLink': "",
      'index': 4,
      'details':
          'A web and mobile application built for middle income people of Bangladesh, to provide telemedical services to the people. The app is built using Flutter, FCM and Parse server.',
      'images': [
        'images/surecare/1.png',
        'images/surecare/2.png',
        'images/surecare/3.png',
        'images/surecare/4.png',
        'images/surecare/5.png',
        'images/surecare/6.png',
      ],
    },
    {
      'title': "Sure Care Admin",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "",
      'index': 5,
      'details':
          'A web and mobile application built for admins of Sure Care Services, to manage the telemedical services. The app is built using Flutter, FCM and Parse server.',
      'images2': [
        'images/surecareadmin/1.png',
        'images/surecareadmin/2.png',
        'images/surecareadmin/3.png',
        'images/surecareadmin/4.png',
        'images/surecareadmin/5.png',
        'images/surecareadmin/6.png',
        'images/surecareadmin/7.png',
        'images/surecareadmin/8.png',
        'images/surecareadmin/9.png',
      ],
    },
    {
      'title': "Sure Care Reviewer",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "",
      'gitLink': "",
      'index': 6,
      'details':
          'A web and mobile application built for reviewers or doctors of Sure Care Services, to review the telemedical requests. The app is built using Flutter, FCM and Parse server.',
      'images2': [
        'images/surecarereviewer/1.png',
        'images/surecarereviewer/2.png',
        'images/surecarereviewer/3.png',
        'images/surecarereviewer/4.png',
        'images/surecarereviewer/5.png',
        'images/surecarereviewer/6.png',
      ],
    },
    {
      'title': "RRAD Password Manager",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "",
      'index': 7,
      'details':
          'A password manager app that allows users to store their passwords securely. The app is built using Flutter, Parse Server and Google Drive API.',
      'images': [
        'images/passgen/1.png',
        'images/passgen/2.png',
        'images/passgen/3.png',
        'images/passgen/4.png',
        'images/passgen/5.png',
        'images/passgen/6.png',
        'images/passgen/7.png',
      ],
    },
    {
      'title': "RRAD ERP Management System",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "https://rrad-erp.web.app",
      'gitLink': "",
      'index': 8,
      'details':
          'A web application for company admins that allows admins to manage their Employees, resourses, projects, sells, calculates balance sheets and many more. The app is built using Flutter, Parse Server and few other APIs.',
      'images2': [
        'images/erp_web/1.png',
        'images/erp_web/2.png',
        'images/erp_web/3.png',
        'images/erp_web/4.png',
        'images/erp_web/5.png',
        'images/erp_web/6.png',
        'images/erp_web/7.png',
        'images/erp_web/8.png',
        'images/erp_web/9.png',
        'images/erp_web/10.png',
        'images/erp_web/11.png',
        'images/erp_web/12.png',
        'images/erp_web/13.png',
        'images/erp_web/14.png',
        'images/erp_web/15.png',
        'images/erp_web/16.png',
        'images/erp_web/17.png',
        'images/erp_web/18.png',
        'images/erp_web/19.png',
        'images/erp_web/20.png',
        'images/erp_web/21.png',
        'images/erp_web/22.png',
        'images/erp_web/23.png',
        'images/erp_web/24.png',
        'images/erp_web/25.png',
        'images/erp_web/26.png',
        'images/erp_web/27.png',
        'images/erp_web/28.png',
        'images/erp_web/29.png',
        'images/erp_web/30.png',
        'images/erp_web/31.png',
        'images/erp_web/32.png',
        'images/erp_web/33.png',
      ],
    },
    {
      'title': "RRAD ERP Mobile App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "https://rrad-erp-mobile.web.app",
      'gitLink': "",
      'index': 9,
      'details':
          'A mobile application for company employees that allows admins to give attendance, apply for leave and edit their informations. The app is built using Flutter, Parse Server and few other APIs.',
      'images': [
        'images/erp_mobile/1.png',
        'images/erp_mobile/2.png',
        'images/erp_mobile/3.png',
        'images/erp_mobile/4.png',
        'images/erp_mobile/5.png',
        'images/erp_mobile/6.png',
        'images/erp_mobile/7.png',
        'images/erp_mobile/8.png',
        'images/erp_mobile/9.png',
        'images/erp_mobile/10.png',
        'images/erp_mobile/11.png',
        'images/erp_mobile/12.png',
        'images/erp_mobile/13.png',
        'images/erp_mobile/14.png',
        'images/erp_mobile/15.png',
        'images/erp_mobile/16.png',
      ],
    },
    {
      'title': "Armario, E-Commerce App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/armario-e-commerce-app",
      'index': 10,
      'details':
          'An E-Commerce app that allows users to buy and sell products. The app is built using Flutter for Learnio app development course!',
      'images': [
        'images/armario/1.png',
        'images/armario/2.png',
        'images/armario/3.png',
        'images/armario/4.png',
        'images/armario/5.png',
        'images/armario/6.png',
        'images/armario/7.png',
        'images/armario/8.png',
        'images/armario/9.png',
        'images/armario/10.png',
      ],
    },
    {
      'title': "Fingertips",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/fingertips",
      'index': 11,
      'details':
          'A mobile application that allows users to give donations to their prefered organizations. The app is built using Flutter, Firebase Rest',
      'images': [
        'images/fingertips/1.png',
        'images/fingertips/2.png',
        'images/fingertips/3.png',
        'images/fingertips/4.png',
        'images/fingertips/5.png',
        'images/fingertips/6.png',
      ],
    },
    {
      'title': "TODOs, A Todo List App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/TODOs-A-to-do-list-app",
      'index': 12,
      'details':
          'A todo list app that allows users to add, edit, delete and mark tasks. The app is built using Flutter.',
      'images': [
        'images/todos/1.png',
        'images/todos/2.png',
        'images/todos/3.png',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return View(
      viewmodel: PortfolioViewmodel(),
      builder: (context, pViewmdoel, __) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: isMobile(context)
              ? CustomAppbar(
                  openDrawer: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  title: Text(
                    "Projects",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              : null,
          drawer: CustomDrawer(context: context, viewmodel: pViewmdoel),
          body: LayoutBuilder(
            builder: (context, constrains) {
              if (constrains.maxWidth > 1000) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDrawer(
                      context: context,
                      viewmodel: pViewmdoel,
                    ),
                    Expanded(
                      flex: 5,
                      child: body(context),
                    ),
                  ],
                );
              } else {
                return body(context);
              }
            },
          ),
        );
      },
    );
  }

  Widget body(BuildContext context) {
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
              portfolioData[int.parse(index!)]['title'],
              style: _theme.textTheme.headline1,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              portfolioData[int.parse(index!)]['details'],
              style: _theme.textTheme.bodyText1,
            ),
            SizedBox(
              height: 45,
            ),
            portfolioData[int.parse(index!)]['images'] != null
                ? CarouselSlider.builder(
                    itemCount:
                        portfolioData[int.parse(index!)]['images'].length,
                    itemBuilder: (BuildContext context, int i, int pi) {
                      return Container(
                        //padding: EdgeInsets.only(right: 45),
                        child: Image(
                          image: AssetImage(
                            portfolioData[int.parse(index!)]['images'][i],
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: isMobile(context)
                          ? MediaQuery.of(context).size.height / 1.4
                          : MediaQuery.of(context).size.height / 1.85,
                      aspectRatio: 1 / 2,
                      viewportFraction: isMobile(context) ? 0.8 : 0.2,
                      initialPage: 2,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(milliseconds: 2000),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      scrollDirection: Axis.horizontal,
                      pageSnapping: false,
                    ),
                  )
                : Container(),
            SizedBox(
              height: 35,
            ),
            Center(
              child: SizedBox(
                width: 250.0,
                height: 25,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    pause: const Duration(milliseconds: 600),
                    animatedTexts: [
                      FadeAnimatedText(
                        parser.emojify(":point_up_2: Tap & Hold to pause!"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            portfolioData[int.parse(index!)]['images2'] != null
                ? Column(
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      CarouselSlider.builder(
                        itemCount:
                            portfolioData[int.parse(index!)]['images2'].length,
                        itemBuilder: (BuildContext context, int i, int pi) {
                          return Container(
                            //padding: EdgeInsets.only(right: 45),
                            child: Image(
                              image: AssetImage(
                                portfolioData[int.parse(index!)]['images2'][i],
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: isMobile(context)
                              ? MediaQuery.of(context).size.height / 1.4
                              : MediaQuery.of(context).size.height / 1.85,
                          aspectRatio: 9 / 16,
                          viewportFraction: isMobile(context) ? 1 : 0.7,
                          initialPage: 2,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(milliseconds: 2000),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: false,
                          scrollDirection: Axis.horizontal,
                          pageSnapping: false,
                        ),
                      )
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
