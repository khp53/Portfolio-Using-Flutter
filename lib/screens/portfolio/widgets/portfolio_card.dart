// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:portfolio/commons/is_mobileCall.dart';
import 'package:portfolio/models/portfolio_dev.dart';
import 'package:portfolio/screens/portfolio/portfolio_viewmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioCard extends StatelessWidget {
  final PortfolioDev portfolioDev;
  final int index;
  final PortfolioViewmodel viewmodel;
  PortfolioCard({
    Key? key,
    required this.viewmodel,
    required this.portfolioDev,
    required this.index,
  }) : super(key: key);

  void _mouseEnter(bool hover) {
    viewmodel.hovering = hover;
    viewmodel.index = index;
  }

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
          // Expanded(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SvgPicture.asset(
          //         icon1,
          //         height: 20,
          //       ),
          //       SizedBox(
          //         width: 10,
          //       ),
          //       icon2.isNotEmpty
          //           ? SvgPicture.asset(
          //               icon2,
          //               height: 20,
          //               // ignore: deprecated_member_use
          //               color: Theme.of(context).colorScheme.background,
          //             )
          //           : Text(
          //               "REST",
          //               style: TextStyle(
          //                 color: Colors.black,
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 18,
          //               ),
          //             ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                portfolioDev.get('projectName').toString(),
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
            portfolioDev.get('color1') != null
                ? Color(
                    int.parse(
                      '0xFF${portfolioDev.get('color1')}',
                    ),
                  )
                : Colors.white,
            portfolioDev.get('color2') != null
                ? Color(
                    int.parse(
                      '0xFF${portfolioDev.get('color2')}',
                    ),
                  )
                : Colors.white,
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
                portfolioDev.get('githubLink') != null &&
                        portfolioDev.get('githubLink') != ""
                    ? InkWell(
                        onTap: () => kIsWeb
                            ? html.window.open(
                                portfolioDev.get('githubLink')!, "GitHub Link")
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
                portfolioDev.get('webLink') != null &&
                        portfolioDev.get('webLink') != ""
                    ? InkWell(
                        onTap: () => kIsWeb
                            ? html.window.open(
                                portfolioDev.get('webLink')!, "Website Link")
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
                portfolioDev.get('appStoreLink') != null &&
                        portfolioDev.get('appStoreLink') != ""
                    ? InkWell(
                        onTap: () => kIsWeb
                            ? html.window.open(
                                portfolioDev.get('appStoreLink')!,
                                "Appstore Link")
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
                portfolioDev.get('playStoreLink') != null &&
                        portfolioDev.get('playStoreLink') != ""
                    ? InkWell(
                        onTap: () => kIsWeb
                            ? html.window.open(
                                portfolioDev.get('playStoreLink')!,
                                "Playstore Link")
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
                portfolioDev.get('shortDescription').toString(),
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
