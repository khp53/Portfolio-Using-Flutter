import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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

  // ScrollController _controller = ScrollController();
  // bool _listAppended = false;

  // /// [_pd2] holds duplicate data and is used to append to [portfolioData].
  // List<String> _pd2 = [];

  // @override
  // void initState() {
  //   _pd2.addAll(portfolioData[int.parse(index!)]['images']);

  //   /// To auto-start the animation when the screen loads.
  //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
  //     _startScroll();
  //   });

  //   /// The [_controller] will notify [_list] to be appended when the animation is near completion.
  //   _controller.addListener(
  //     () {
  //       if (_controller.position.pixels >
  //           _controller.position.maxScrollExtent) {
  //         if (_listAppended == false) {
  //           portfolioData[int.parse(index!)]['images'].addAll(_pd2);
  //           _listAppended = true;
  //         }
  //       }

  //       /// The [_controller] will listen for when the animation cycle completes,
  //       /// so this can immediately re-start from the completed position.
  //       if (_controller.position.pixels ==
  //           _controller.position.maxScrollExtent * 0.92) {
  //         _listAppended = false;
  //         setState(() {});
  //         WidgetsBinding.instance!.addPostFrameCallback(
  //           (timeStamp) {
  //             _startScroll();
  //           },
  //         );
  //       }
  //     },
  //   );
  //   super.initState();
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  // }

  // void _startScroll() {
  //   _controller.animateTo(_controller.position.maxScrollExtent,
  //       duration: Duration(milliseconds: 8000), curve: Curves.linear);
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

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
    },
    {
      'title': "Armario, E-Commerce App",
      'color1': Color(0xffFE582D),
      'color2': Color(0xffE50AAA),
      'webLink': "",
      'gitLink': "https://github.com/khp53/armario-e-commerce-app",
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
            CarouselSlider.builder(
                itemCount: portfolioData[int.parse(index!)]['images'].length,
                itemBuilder: (BuildContext context, int i, int pi) {
                  return Container(
                    //padding: EdgeInsets.only(right: 45),
                    child: Image(
                        image: AssetImage(
                            portfolioData[int.parse(index!)]['images'][i])),
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height / 1.85,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.2,
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
                ))
          ],
        ),
      ),
    );
  }
}
