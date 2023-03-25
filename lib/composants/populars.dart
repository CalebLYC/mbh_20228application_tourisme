import 'package:flutter/material.dart';
import 'package:mbh/composants/popular_card.dart';
import 'package:mbh/models/Hotel.dart';
import 'package:mbh/utils/data.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PopularsHotels extends StatefulWidget {
  const PopularsHotels({super.key});

  @override
  State<PopularsHotels> createState() => _PopularsHotelsState();
}

class _PopularsHotelsState extends State<PopularsHotels> {
  final List<Hotel> hotels = popularsHotels;
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _pageHasContentDimensions = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.position.hasContentDimensions &&
          !_pageHasContentDimensions) {
        setState(() {
          _pageHasContentDimensions = true;
        });
      }
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.4,
      child: CarouselSlider.builder(
        itemCount: hotels.length,
        itemBuilder: (BuildContext context, int index, int j) {
          return PopularHotelCard(
            hotel: hotels[index],
          );
        },
        options: CarouselOptions(
          height: 400,
          enableInfiniteScroll: true,
          viewportFraction: 0.7,
          onPageChanged: (index, reason) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
    );
  }
}
