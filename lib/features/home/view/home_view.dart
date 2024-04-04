import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/drawer/view/view.dart';
import 'package:harri_farm_app/features/home/bloc/home_bloc.dart';
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
import 'package:harri_farm_app/features/home/widgets/home_slider.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      appBar: const HomeAppBar(),
      drawer: const AppDrawerView(),
      body: BlocBuilder<HomeBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is Done) {
            return HomeBuildLoadedItems(homeSectionsList: homeSectionsList);
          } else if (state is Error) {
            return Center(
              child: AppText(title: 'error_loading_data'.tr()),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class HomeBuildLoadedItems extends StatelessWidget {
  final dynamic homeSectionsList;
  const HomeBuildLoadedItems({
    super.key,
    required this.homeSectionsList,
  });

  @override
  Widget build(BuildContext context) {
    return AppDecoratedBackGround(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 22.height),
            const HomeWelcomeWidget(),
            SizedBox(height: 22.height),
            const HomeSearchField(),
            SizedBox(height: 16.height),
            const HomeSlider(),
            SizedBox(height: 16.height),
            HomeSections(homeSectionsList: homeSectionsList),
            SizedBox(height: 16.height),
            const HomeOffersBar(),
            SizedBox(height: 16.height),
            const HomeOffersCards(),
            SizedBox(height: 16.height),
            const HomeAdverts(),
            SizedBox(height: Utils.bottomDevicePadding),
          ],
        ),
      ),
    );
  }
}
