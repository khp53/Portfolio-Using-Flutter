import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:get/get.dart';
import 'package:portfolio/commons/custom_appbar.dart';
import 'package:portfolio/commons/custom_drawer.dart';
import 'package:portfolio/commons/is_mobileCall.dart';
import 'package:portfolio/models/portfolio_dev.dart';
import 'package:portfolio/screens/portfolio/portfolio_viewmodel.dart';
import 'package:portfolio/screens/view.dart';

class PortfolioDetails extends StatefulWidget {
  PortfolioDetails({
    Key? key,
  }) : super(key: key);
  @override
  State<PortfolioDetails> createState() => _PortfolioDetailsState();
}

class _PortfolioDetailsState extends State<PortfolioDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String? index = Get.parameters['id'];
  PortfolioDev portfolioDev = Get.arguments;

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
        margin: !isMobile(context) ? EdgeInsets.all(30) : EdgeInsets.all(10),
        padding: !isMobile(context) ? EdgeInsets.all(30) : EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              portfolioDev.get('projectName'),
              style: _theme.textTheme.displayLarge!.copyWith(
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 20,
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
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    portfolioDev.get('description'),
                    textAlign: TextAlign.justify,
                    style: _theme.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: CarouselSlider(
                    items: [
                      portfolioDev.screen1.url != null
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Image.network(
                                portfolioDev.screen1.url!,
                                fit: BoxFit.contain,
                              ),
                            )
                          : Container(),
                      portfolioDev.screen2.url != null
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Image.network(
                                portfolioDev.screen2.url!,
                                fit: BoxFit.contain,
                              ),
                            )
                          : Container(),
                      portfolioDev.screen3.url != null
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Image.network(
                                portfolioDev.screen3.url!,
                                fit: BoxFit.contain,
                              ),
                            )
                          : Container(),
                      portfolioDev.screen4.url != null
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Image.network(
                                portfolioDev.screen4.url!,
                                fit: BoxFit.contain,
                              ),
                            )
                          : Container(),
                      portfolioDev.screen5.url != null
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Image.network(
                                portfolioDev.screen5.url!,
                                fit: BoxFit.contain,
                              ),
                            )
                          : Container(),
                      portfolioDev.screen6.url != null
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Image.network(
                                portfolioDev.screen6.url!,
                                fit: BoxFit.contain,
                              ),
                            )
                          : Container(),
                      portfolioDev.screen7.url != null
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Image.network(
                                portfolioDev.screen7.url!,
                                fit: BoxFit.contain,
                              ),
                            )
                          : Container(),
                      portfolioDev.screen8.url != null
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Image.network(
                                portfolioDev.screen8.url!,
                                fit: BoxFit.contain,
                              ),
                            )
                          : Container(),
                      portfolioDev.screen9.url != null
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Image.network(
                                portfolioDev.screen9.url!,
                                fit: BoxFit.contain,
                              ),
                            )
                          : Container(),
                      portfolioDev.screen10.url != null
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Image.network(
                                portfolioDev.screen10.url!,
                                fit: BoxFit.contain,
                              ),
                            )
                          : Container(),
                    ],
                    options: CarouselOptions(
                      height: isMobile(context)
                          ? MediaQuery.of(context).size.height / 1.4
                          : MediaQuery.of(context).size.height / 1.2,
                      aspectRatio: 1,
                      viewportFraction: isMobile(context) ? 0.8 : 0.7,
                      initialPage: 1,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(milliseconds: 2000),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: false,
                      scrollDirection: Axis.vertical,
                      pageSnapping: false,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
