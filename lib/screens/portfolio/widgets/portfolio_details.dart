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
      'title': "ShunBoi - Audiobook & Stories",
      'color1': Color.fromARGB(255, 24, 165, 252),
      'color2': Color.fromARGB(255, 45, 108, 254),
      'webLink': "https://shunboi.com",
      'gitLink': "",
      'playStore':
          "https://play.google.com/store/apps/details?id=com.shunboi&hl=en&gl=US",
      'index': 0,
      'details':
          "specifically to Bengali content. With ShunBoi, you can immerse yourself in a world of captivating audiobooks, engaging short stories, insightful book summaries, and enriching podcasts.\n\nExplore a vast library of Bengali literature and literary works, carefully curated to bring you a diverse range of genres and themes. Whether you're a book lover, a language enthusiast, or someone who simply enjoys the pleasure of listening, ShunBoi offers a seamless platform for discovering and enjoying high-quality audio content.\n\nFeatures: It has deeplinking, a mini audioplayer to full-sized audioplayer, eye catching animations, proper chapter management, proper background playback management, recently played, payment gateway and much more.",
      'images': [
        'images/shunboi/s_1.png',
        'images/shunboi/s_2.png',
        'images/shunboi/s_3.png',
        'images/shunboi/s_4.png',
        'images/shunboi/s_5.png',
        'images/shunboi/s_6.png',
        'images/shunboi/s_7.png',
        'images/shunboi/s_8.png',
        'images/shunboi/s_9.png',
        'images/shunboi/s_10.png',
        'images/shunboi/s_11.png',
        'images/shunboi/s_12.png',
        'images/shunboi/s_13.png',
        'images/shunboi/s_14.png',
        'images/shunboi/s_15.png',
        'images/shunboi/s_16.png',
        'images/shunboi/s_17.png',
        'images/shunboi/s_18.png',
        'images/shunboi/s_19.png',
        'images/shunboi/s_20.png',
      ],
    },
    {
      'title': "UTM COVID-19 Contact Tracing Application",
      'color1': Color(0xff18EBFC),
      'color2': Color(0xff00EDBF),
      'webLink': "https://utm-covid19-contact-tracing.web.app",
      'gitLink': "https://github.com/khp53/UTM-COVID19-Contact-Tracing-System",
      'index': 1,
      'details':
          "Introducing UTM COVID-19 Contact Tracing System (UTM CCTA): an essential solution in the fight against the novel coronavirus (COVID-19). To prevent the spread of COVID-19 on the Universiti Teknologi Malaysia (UTM) campus, including among students and staff, a comprehensive contact tracing system has been developed by me.\n\nUTM CCTA is a hybrid system comprising a mobile application for UTM students and a web application for UTM Health Authorities and administrators. Through the mobile application, UTM students can automatically scan for nearby contacts, keeping a record of their interactions throughout the day. Simultaneously, UTM Health Authorities and administrators can access the web application to search for users and update their COVID-19 status.\n\nIf a user is tested positive for COVID-19, the system immediately alerts all individuals who have had close contact with them. This efficient notification process ensures that potential exposure is quickly identified and appropriate actions can be taken.\n\nFurthermore, users can contribute to the system by providing their day-to-day commute locations manually, assisting UTM in monitoring potential hotspots. Whenever two users come into contact, the system records the location and time of the interaction, storing this data securely in the database. Only authorized administrators can access this information to analyze trends and identify locational hotspots. Prompt alerts can then be sent to all registered users, keeping them informed and vigilant.\n\nUTM COVID-19 Contact Tracing System (UTM CCTA) is an indispensable tool in safeguarding the UTM campus and its community. By tracking and notifying contacts, this automated system plays a crucial role in curbing the spread of COVID-19 and ensuring the well-being of students, staff, and faculty members. Together, we can combat this virus and create a safer environment for all.\n\nThe application is built using Flutter, Firebase, Node JS, and Google Nearby API.",
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
      'title': "COVID Detector App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/COVID-Detector",
      'index': 2,
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
      'index': 3,
      'details':
          'SureCare is an innovative responsive medical services platform that provides medical advisory services to its members. The platform is composed of a network of national and international doctors and practitioners as well as medical service providers in Bangladesh. \n\nThe app is built using Flutter, FCM and Parse server.',
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
      'index': 4,
      'details':
          'A web and mobile application built for admins of Sure Care Services, to manage the telemedical services. The app is built using Flutter, FCM and Parse server.\n\nThis is the app for Sure Care Admins.',
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
      'index': 5,
      'details':
          'A web and mobile application built for reviewers or doctors of Sure Care Services, to review the telemedical requests. The app is built using Flutter, FCM and Parse server.\n\nThis is the app for Sure Care Doctors.',
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
      'index': 6,
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
      'index': 7,
      'details':
          'A web application for company admins that allows admins to manage their Employees, resourses, projects, sells, calculates balance sheets, create invoices and many more. The app is built using Flutter, Parse Server and few other APIs.',
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
      'index': 8,
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
      'title': "Fingertips",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/fingertips",
      'index': 9,
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
      'title': "TODOs, A Todo List App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/TODOs-A-to-do-list-app",
      'index': 11,
      'details':
          'A todo list app that allows users to add, edit, delete and mark tasks. The app is built using Flutter.',
      'images': [
        'images/todos/1.png',
        'images/todos/2.png',
        'images/todos/3.png',
      ],
    },
    {
      'title': "Shopper, An E-Commerce App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/Shopper-E-Commerce-App",
      'index': 12,
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
      'index': 13,
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
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView(
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
              style: _theme.textTheme.displayLarge,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              portfolioData[int.parse(index!)]['details'],
              textAlign: TextAlign.justify,
              style: _theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 60,
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
