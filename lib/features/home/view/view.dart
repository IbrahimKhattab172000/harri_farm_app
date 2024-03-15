import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_product_card.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
      body: AppDecoratedBackGround(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Utils.topDevicePadding + 16.height),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        Utils.getAssetPNGPath("menu_icon"),
                        width: 22.width,
                      ),
                    ),
                    const Spacer(),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            Utils.getAssetPNGPath("shopping_icon"),
                            width: 22.width,
                          ),
                        ),
                        const Positioned(
                          top: -5,
                          right: -8,
                          child: CircleAvatar(
                            backgroundColor: AppColors.red,
                            radius: 10,
                            child: Center(
                              child: AppText(
                                textAlign: TextAlign.center,
                                title: "2",
                                fontSize: 10,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15.width),
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            Utils.getAssetPNGPath("bell_icon"),
                            width: 22.width,
                          ),
                        ),
                        const Positioned(
                          top: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: AppColors.primary,
                            radius: 5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 24.height),
                Row(
                  children: [
                    Image.asset(
                      Utils.getAssetPNGPath("hand"),
                      width: 20.width,
                      height: 20.height,
                    ),
                    SizedBox(width: 16.width),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          title: "welcome_again".tr(),
                          fontSize: 20,
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        AppText(
                          title: "all_your_products_are_available".tr(),
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 22.height),
                AppTextField(
                  leading: const Icon(
                    Icons.search,
                    color: AppColors.lightGray,
                  ),
                  hint: "search_for_product".tr(),
                ),
                SizedBox(height: 16.height),
                const HomeSlider(),
                SizedBox(height: 16.height),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: "sections".tr(),
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: 88.height,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: homeSectionsList.length,
                        itemBuilder: (context, index) {
                          final section = homeSectionsList[index];
                          return HomeSectionCard(
                            color: section['color'] as Color,
                            imagePath: section['imagePath'] as String,
                            name: section['name'] as String,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: 16.width);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.height),
                Row(
                  children: [
                    AppText(
                      title: "offers".tr(),
                      fontSize: 14,
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    const Spacer(),
                    AppText(
                      title: "show_more".tr(),
                      fontSize: 14,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
                SizedBox(height: 16.height),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppProductCard(),
                    AppProductCard(),
                  ],
                ),
                SizedBox(height: 16.height),
                const HomeSlider(),
                SizedBox(height: 32.height),
                Center(
                  child: Image.asset(
                    Utils.getAssetPNGPath("logo"),
                    height: 92.height,
                    width: 92.width,
                  ),
                ),
                SizedBox(height: Utils.bottomDevicePadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeSectionCard extends StatelessWidget {
  final Color color;
  final String imagePath;
  final String name;
  const HomeSectionCard({
    super.key,
    required this.color,
    required this.imagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74.width,
      height: 88.height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 38.height,
            width: 38.width,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.white,
            ),
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              Utils.getAssetPNGPath(imagePath),
            ),
          ),
          SizedBox(width: 4.width),
          AppText(
            title: name.tr(),
            color: AppColors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
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
            TopViewedCard(),
            TopViewedCard(),
            TopViewedCard(),
          ],
        ),
        SizedBox(height: 10.height),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) {
              return DotIndicator(
                isActive: index == _currentIndex,
              );
            },
          ),
        ),
      ],
    );
  }
}

class DotIndicator extends StatelessWidget {
  final bool isActive;

  const DotIndicator({super.key, required this.isActive});

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

class TopViewedCard extends StatelessWidget {
  const TopViewedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        Utils.getAssetPNGPath("top_viewed_meat"),
        fit: BoxFit.cover,
      ),
    );
  }
}
