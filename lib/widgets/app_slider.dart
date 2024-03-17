import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/home/widgets/home_dot_indicator.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_top_view_card.dart';

class AppSlider extends StatefulWidget {
  const AppSlider({super.key});

  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 148.height,
            viewportFraction: 0.75,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            autoPlay: true,
            onPageChanged: (index, _) => setState(() => _currentIndex = index),
          ),
          items: const [
            AppTopViewedCard(),
            AppTopViewedCard(),
            AppTopViewedCard()
          ],
        ),
        SizedBox(height: 10.height),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) {
              return HomeDotIndicator(
                isActive: index == _currentIndex,
              );
            },
          ),
        ),
      ],
    );
  }
}
