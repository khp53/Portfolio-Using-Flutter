import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:portfolio/commons/is_mobileCall.dart';
import 'package:portfolio/models/portfolio_dev.dart';

class PortfolioImageViewer extends StatefulWidget {
  const PortfolioImageViewer({super.key, required this.portfolioDev});
  final PortfolioDev portfolioDev;

  @override
  State<PortfolioImageViewer> createState() => _PortfolioImageViewerState();
}

class _PortfolioImageViewerState extends State<PortfolioImageViewer> {
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.close,
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Colors.white,
                ),
              ),
            ),
          ),
          Spacer(),
          CarouselSlider(
            carouselController: _controller,
            items: [
              widget.portfolioDev.screen1 != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CachedNetworkImage(
                        imageUrl: widget.portfolioDev.screen1!.url!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Container(),
              widget.portfolioDev.screen2 != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CachedNetworkImage(
                        imageUrl: widget.portfolioDev.screen2!.url!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Container(),
              widget.portfolioDev.screen3 != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CachedNetworkImage(
                        imageUrl: widget.portfolioDev.screen3!.url!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Container(),
              widget.portfolioDev.screen4 != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CachedNetworkImage(
                        imageUrl: widget.portfolioDev.screen4!.url!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Container(),
              widget.portfolioDev.screen5 != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CachedNetworkImage(
                        imageUrl: widget.portfolioDev.screen5!.url!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Container(),
              widget.portfolioDev.screen6 != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CachedNetworkImage(
                        imageUrl: widget.portfolioDev.screen6!.url!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Container(),
              widget.portfolioDev.screen7 != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CachedNetworkImage(
                        imageUrl: widget.portfolioDev.screen7!.url!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Container(),
              widget.portfolioDev.screen8 != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CachedNetworkImage(
                        imageUrl: widget.portfolioDev.screen8!.url!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Container(),
              widget.portfolioDev.screen9 != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CachedNetworkImage(
                        imageUrl: widget.portfolioDev.screen9!.url!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Container(),
              widget.portfolioDev.screen10 != null
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CachedNetworkImage(
                        imageUrl: widget.portfolioDev.screen10!.url!,
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
              viewportFraction: isMobile(context) ? 0.8 : 0.6,
              initialPage: 1,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: Duration(milliseconds: 2000),
              autoPlayAnimationDuration: Duration(milliseconds: 100),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
              pageSnapping: false,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () => _controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  ),
                  child: Text('Previous'),
                ),
                const SizedBox(width: 20),
                MaterialButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () => _controller.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  ),
                  child: Text('Next'),
                ),
              ],
            ),
          ),
          //const SizedBox(height: 20),
        ],
      ),
    );
  }
}
