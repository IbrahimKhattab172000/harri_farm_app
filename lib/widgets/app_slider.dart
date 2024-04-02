import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/home/bloc/home_bloc.dart';
import 'package:harri_farm_app/helpers/colors.dart';
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
    final bloc = HomeBloc.of(context);
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
          items: bloc.homeData.banner!.map((banner) {
            return AppTopViewedCard(imagePath: banner.image!);
          }).toList(),
        ),
        SizedBox(height: 10.height),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            bloc.homeData.banner!.length,
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

class HomeDotIndicator extends StatelessWidget {
  final bool isActive;

  const HomeDotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 16.width,
      height: 6.width,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.lightGray,
        borderRadius: BorderRadius.circular(45),
      ),
    );
  }
}
