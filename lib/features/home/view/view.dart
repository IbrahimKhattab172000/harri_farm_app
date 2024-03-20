import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/drawer/view/view.dart';
import 'package:harri_farm_app/features/home/widgets/home_app_bar.dart';
import 'package:harri_farm_app/features/home/widgets/home_logo.dart';
import 'package:harri_farm_app/features/home/widgets/home_offers_bar.dart';
import 'package:harri_farm_app/features/home/widgets/home_offers_card.dart';
import 'package:harri_farm_app/features/home/widgets/home_search_field.dart';
import 'package:harri_farm_app/features/home/widgets/home_sections.dart';
import 'package:harri_farm_app/features/home/widgets/home_welcome_widget.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_slider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    //I left iف here for now cuz it will be replaced by the data coming to us from the backend
    final homeSectionsList = [
      {
        'color': AppColors.section1,
        'imagePath': 'meat',
        'name': 'meat',
      },
      {
        'color': AppColors.section2,
        'imagePath': 'fish',
        'name': 'fish',
      },
      {
        'color': AppColors.section1,
        'imagePath': 'meat',
        'name': 'meat',
      },
      {
        'color': AppColors.section2,
        'imagePath': 'fish',
        'name': 'fish',
      },
      {
        'color': AppColors.section3,
        'imagePath': 'fruit',
        'name': 'fruit',
      },
      {
        'color': AppColors.section4,
        'imagePath': 'vege',
        'name': 'vege',
      },
    ];

    return Scaffold(
      drawer: const AppDrawerView(),
      body: AppDecoratedBackGround(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Utils.topDevicePadding + 16.height),
              const HomeAppBar(),
              SizedBox(height: 24.height),
              const HomeWelcomeWidget(),
              SizedBox(height: 22.height),
              const HomeSearchField(),
              SizedBox(height: 16.height),
              const AppSlider(),
              SizedBox(height: 16.height),
              HomeSections(homeSectionsList: homeSectionsList),
              SizedBox(height: 16.height),
              const HomeOffersBar(),
              SizedBox(height: 16.height),
              const HomeOffersCards(),
              SizedBox(height: 16.height),
              const AppSlider(),
              SizedBox(height: 32.height),
              const HomeLogo(),
              SizedBox(height: Utils.bottomDevicePadding),
            ],
          ),
        ),
      ),
    );
  }
}
