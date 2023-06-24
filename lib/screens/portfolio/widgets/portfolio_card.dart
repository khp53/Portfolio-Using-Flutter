// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/commons/is_mobileCall.dart';
import 'package:portfolio/screens/portfolio/portfolio_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioCard extends StatelessWidget {
  final String title;
  final Color color1;
  final Color color2;
  final icon1;
  final icon2;
  final gitLink;
  final webLink;
  final appStore;
  final playStore;
  final index;
  final details;
  final PortfolioViewmodel viewmodel;
  PortfolioCard({
    Key? key,
    required this.title,
    required this.color1,
    required this.color2,
    this.icon1,
    this.icon2,
    required this.viewmodel,
    this.webLink,
    this.gitLink,
    this.index,
    this.details,
    this.appStore,
    this.playStore,
  }) : super(key: key);

  void _mouseEnter(bool hover) {
    viewmodel.hovering = hover;
    viewmodel.index = index;
  }

  void _launchURL() async => await canLaunchUrl(Uri.parse(webLink))
      ? await launchUrl(Uri.parse(webLink))
      : throw 'Could not launch $webLink';

  void _launchGitURL() async => await canLaunchUrl(Uri.parse(gitLink))
      ? await launchUrl(Uri.parse(gitLink))
      : throw 'Could not launch $gitLink';

  void _launchAppStoreURL() async => await canLaunchUrl(Uri.parse(appStore))
      ? await launchUrl(Uri.parse(appStore))
      : throw 'Could not launch $appStore';

  void _launchPlayStoreURL() async => await canLaunchUrl(Uri.parse(playStore))
      ? await launchUrl(Uri.parse(playStore))
      : throw 'Could not launch $playStore';

  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -5, 0);

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? GestureDetector(
            onTap: () {
              viewmodel.hovering = !viewmodel.hovering;
              viewmodel.index = index;
            },
            child: AnimatedContainer(
              transform: viewmodel.hovering && viewmodel.index == index
                  ? hoverTransform
                  : nonHoverTransform,
              duration: const Duration(milliseconds: 200),
              child: viewmodel.hovering && viewmodel.index == index
                  ? _buildHoverWidget()
                  : _buildNonHoverWidget(context),
            ),
          )
        : MouseRegion(
            onEnter: (e) => _mouseEnter(true),
            onExit: (e) => _mouseEnter(false),
            child: AnimatedContainer(
              transform: viewmodel.hovering && viewmodel.index == index
                  ? hoverTransform
                  : nonHoverTransform,
              duration: const Duration(milliseconds: 200),
              child: viewmodel.hovering && viewmodel.index == index
                  ? _buildHoverWidget()
                  : _buildNonHoverWidget(context),
            ),
          );
  }

  Container _buildNonHoverWidget(context) {
    return Container(
      width: 317,
      height: 317,
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  icon1,
                  height: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                icon2.isNotEmpty
                    ? SvgPicture.asset(
                        icon2,
                        height: 20,
                        // ignore: deprecated_member_use
                        color: Theme.of(context).colorScheme.background,
                      )
                    : Text(
                        "REST",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            color1,
            color2,
          ],
        ),
      ),
    );
  }

  Container _buildHoverWidget() {
    return Container(
      width: 317,
      height: 317,
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  child: Row(
                    children: [
                      Text(
                        "Details",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                  onPressed: () => Get.toNamed(
                    "/portfolio/details/",
                    parameters: {
                      'id': index.toString(),
                    },
                  ),
                ),
                Spacer(),
                gitLink != null && gitLink != ""
                    ? InkWell(
                        onTap: () => kIsWeb
                            ? html.window.open(gitLink, "GitHub Link")
                            : _launchGitURL,
                        child: FaIcon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                    : Container(),
                SizedBox(
                  width: 10,
                ),
                webLink != null && webLink != ""
                    ? InkWell(
                        onTap: () => kIsWeb
                            ? html.window.open(webLink, "Website Link")
                            : _launchURL,
                        child: Icon(
                          Icons.launch,
                          color: Colors.white,
                          size: 22,
                        ),
                      )
                    : Container(),
                SizedBox(
                  width: 10,
                ),
                appStore != null && appStore != ""
                    ? InkWell(
                        onTap: () => kIsWeb
                            ? html.window.open(appStore, "Appstore Link")
                            : _launchAppStoreURL(),
                        child: FaIcon(
                          FontAwesomeIcons.appStoreIos,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                    : Container(),
                SizedBox(
                  width: 10,
                ),
                playStore != null && playStore != ""
                    ? InkWell(
                        onTap: () => kIsWeb
                            ? html.window.open(playStore, "Playstore Link")
                            : _launchPlayStoreURL(),
                        child: FaIcon(
                          FontAwesomeIcons.googlePlay,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                details.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 5),
      ),
    );
  }
}
