// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:get/get.dart';
import 'package:portfolio/commons/custom_appbar.dart';
import 'package:portfolio/commons/custom_drawer.dart';
import 'package:portfolio/commons/is_mobileCall.dart';
import 'package:portfolio/models/portfolio_dev.dart';
import 'package:portfolio/screens/portfolio/portfolio_viewmodel.dart';
import 'package:portfolio/screens/view.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void _launchURL() async => await canLaunchUrl(
        Uri.parse(
          portfolioDev.get('webLink'),
        ),
      )
          ? await launchUrl(Uri.parse(portfolioDev.get('webLink')))
          : throw 'Could not launch webLink!';

  void _launchGitURL() async => await canLaunchUrl(
        Uri.parse(
          portfolioDev.get('githubLink'),
        ),
      )
          ? await launchUrl(Uri.parse(portfolioDev.get('githubLink')))
          : throw 'Could not launch githubLink!';

  void _launchAppStoreURL() async => await canLaunchUrl(
        Uri.parse(
          portfolioDev.get('appStoreLink'),
        ),
      )
          ? await launchUrl(
              Uri.parse(
                portfolioDev.get('appStoreLink'),
              ),
            )
          : throw 'Could not launch appStoreLink';

  void _launchPlayStoreURL() async =>
      await canLaunchUrl(Uri.parse(portfolioDev.get('playStoreLink')!))
          ? await launchUrl(
              Uri.parse(
                portfolioDev.get('playStoreLink'),
              ),
            )
          : throw 'Could not launch $portfolioDev.playStoreLink!';

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewmodel: PortfolioViewmodel(),
      builder: (context, pViewModel, __) {
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
          drawer: CustomDrawer(context: context, viewmodel: pViewModel),
          body: LayoutBuilder(
            builder: (context, constrains) {
              if (constrains.maxWidth > 1000) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDrawer(
                      context: context,
                      viewmodel: pViewModel,
                    ),
                    Expanded(
                      flex: 5,
                      child: body(context, pViewModel),
                    ),
                  ],
                );
              } else {
                return mobileBody(context, pViewModel);
              }
            },
          ),
        );
      },
    );
  }

  Widget body(BuildContext context, PortfolioViewmodel viewmodel) {
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
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            portfolioDev.get('appStoreLink') != null &&
                                    portfolioDev.get('appStoreLink') != ""
                                ? Expanded(
                                    child: InkWell(
                                      onTap: () => kIsWeb
                                          ? html.window.open(
                                              portfolioDev.get('appStoreLink')!,
                                              "App Store Link",
                                            )
                                          : _launchAppStoreURL(),
                                      child: SizedBox(
                                        height: 65,
                                        child: Image.asset(
                                          'images/badges/app_store.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            portfolioDev.get('playStoreLink') != null &&
                                    portfolioDev.get('playStoreLink') != ""
                                ? Expanded(
                                    child: InkWell(
                                      onTap: () => kIsWeb
                                          ? html.window.open(
                                              portfolioDev
                                                  .get('playStoreLink')!,
                                              "Play Store Link",
                                            )
                                          : _launchPlayStoreURL(),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: SizedBox(
                                          height: 65,
                                          child: Image.asset(
                                            'images/badges/play.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            portfolioDev.get('webLink') != null &&
                                    portfolioDev.get('webLink') != ""
                                ? Expanded(
                                    child: InkWell(
                                      onTap: () => kIsWeb
                                          ? html.window.open(
                                              portfolioDev.get('webLink')!,
                                              "Web Link",
                                            )
                                          : _launchURL(),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: SizedBox(
                                          height: 65,
                                          child: Image.asset(
                                            'images/badges/web-app-badge.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            portfolioDev.get('githubLink') != null &&
                                    portfolioDev.get('githubLink') != ""
                                ? Expanded(
                                    child: InkWell(
                                      onTap: () => kIsWeb
                                          ? html.window.open(
                                              portfolioDev.get('githubLink')!,
                                              "Github Link",
                                            )
                                          : _launchGitURL(),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: SizedBox(
                                          height: 65,
                                          child: Image.asset(
                                            'images/badges/github.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        SelectableText(
                          portfolioDev.get('description').toString(),
                          textAlign: TextAlign.justify,
                          style: _theme.textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.normal,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      _buildPause(parser, viewmodel),
                      SizedBox(
                        height: 15,
                      ),
                      CarouselSlider(
                        items: [
                          portfolioDev.screen1 != null
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: CachedNetworkImage(
                                    imageUrl: portfolioDev.screen1!.url!,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Container(),
                          portfolioDev.screen2 != null
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: CachedNetworkImage(
                                    imageUrl: portfolioDev.screen2!.url!,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Container(),
                          portfolioDev.screen3 != null
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: CachedNetworkImage(
                                    imageUrl: portfolioDev.screen3!.url!,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Container(),
                          portfolioDev.screen4 != null
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: CachedNetworkImage(
                                    imageUrl: portfolioDev.screen4!.url!,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Container(),
                          portfolioDev.screen5 != null
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: CachedNetworkImage(
                                    imageUrl: portfolioDev.screen5!.url!,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Container(),
                          portfolioDev.screen6 != null
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: CachedNetworkImage(
                                    imageUrl: portfolioDev.screen6!.url!,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Container(),
                          portfolioDev.screen7 != null
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: CachedNetworkImage(
                                    imageUrl: portfolioDev.screen7!.url!,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Container(),
                          portfolioDev.screen8 != null
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: CachedNetworkImage(
                                    imageUrl: portfolioDev.screen8!.url!,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Container(),
                          portfolioDev.screen9 != null
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: CachedNetworkImage(
                                    imageUrl: portfolioDev.screen9!.url!,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : Container(),
                          portfolioDev.screen10 != null
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: CachedNetworkImage(
                                    imageUrl: portfolioDev.screen10!.url!,
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
                          autoPlay: viewmodel.stopAutoPlay,
                          autoPlayInterval: Duration(milliseconds: 2000),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 100),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: false,
                          scrollDirection: Axis.vertical,
                          pageSnapping: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildPause(EmojiParser parser, PortfolioViewmodel viewmodel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
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
                  parser
                      .emojify(":point_up_2: Tap on the pause button to stop!"),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
          onPressed: () {
            viewmodel.stopAutoPlay = !viewmodel.stopAutoPlay;
          },
          icon: Icon(
            viewmodel.stopAutoPlay == true ? Icons.pause : Icons.play_arrow,
          ),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget mobileBody(BuildContext context, PortfolioViewmodel viewmodel) {
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
                fontSize: 40,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            _buildPause(parser, viewmodel),
            SizedBox(
              height: 25,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                portfolioDev.get('appStoreLink') != null &&
                        portfolioDev.get('appStoreLink') != ""
                    ? Expanded(
                        child: InkWell(
                          onTap: () => kIsWeb
                              ? html.window.open(
                                  portfolioDev.get('appStoreLink')!,
                                  "App Store Link",
                                )
                              : _launchAppStoreURL(),
                          child: SizedBox(
                            height: 65,
                            child: Image.asset(
                              'images/badges/app_store.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                portfolioDev.get('playStoreLink') != null &&
                        portfolioDev.get('playStoreLink') != ""
                    ? Expanded(
                        child: InkWell(
                          onTap: () => kIsWeb
                              ? html.window.open(
                                  portfolioDev.get('playStoreLink')!,
                                  "Play Store Link",
                                )
                              : _launchPlayStoreURL(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 65,
                              child: Image.asset(
                                'images/badges/play.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                portfolioDev.get('webLink') != null &&
                        portfolioDev.get('webLink') != ""
                    ? Expanded(
                        child: InkWell(
                          onTap: () => kIsWeb
                              ? html.window.open(
                                  portfolioDev.get('webLink')!,
                                  "Web Link",
                                )
                              : _launchURL(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 65,
                              child: Image.asset(
                                'images/badges/web-app-badge.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
                portfolioDev.get('githubLink') != null &&
                        portfolioDev.get('githubLink') != ""
                    ? Expanded(
                        child: InkWell(
                          onTap: () => kIsWeb
                              ? html.window.open(
                                  portfolioDev.get('githubLink')!,
                                  "Github Link",
                                )
                              : _launchGitURL(),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 65,
                              child: Image.asset(
                                'images/badges/github.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 450,
              child: CarouselSlider(
                items: [
                  portfolioDev.screen1 != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CachedNetworkImage(
                            imageUrl: portfolioDev.screen1!.url!,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Container(),
                  portfolioDev.screen2 != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CachedNetworkImage(
                            imageUrl: portfolioDev.screen2!.url!,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Container(),
                  portfolioDev.screen3 != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CachedNetworkImage(
                            imageUrl: portfolioDev.screen3!.url!,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Container(),
                  portfolioDev.screen4 != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CachedNetworkImage(
                            imageUrl: portfolioDev.screen4!.url!,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Container(),
                  portfolioDev.screen5 != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CachedNetworkImage(
                            imageUrl: portfolioDev.screen5!.url!,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Container(),
                  portfolioDev.screen6 != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CachedNetworkImage(
                            imageUrl: portfolioDev.screen6!.url!,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Container(),
                  portfolioDev.screen7 != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CachedNetworkImage(
                            imageUrl: portfolioDev.screen7!.url!,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Container(),
                  portfolioDev.screen8 != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CachedNetworkImage(
                            imageUrl: portfolioDev.screen8!.url!,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Container(),
                  portfolioDev.screen9 != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CachedNetworkImage(
                            imageUrl: portfolioDev.screen9!.url!,
                            fit: BoxFit.contain,
                          ),
                        )
                      : Container(),
                  portfolioDev.screen10 != null
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: CachedNetworkImage(
                            imageUrl: portfolioDev.screen10!.url!,
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
                  viewportFraction: isMobile(context) ? 0.5 : 0.7,
                  initialPage: 2,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: viewmodel.stopAutoPlay,
                  autoPlayInterval: Duration(milliseconds: 2000),
                  autoPlayAnimationDuration: Duration(milliseconds: 100),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                  pageSnapping: false,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              portfolioDev.get('description').toString(),
              textAlign: TextAlign.justify,
              style: _theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
