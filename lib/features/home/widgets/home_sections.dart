import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/home/widgets/home_section_card.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class HomeSections extends StatelessWidget {
  const HomeSections({
    super.key,
    required this.homeSectionsList,
  });

  final List<Map<String, Object>> homeSectionsList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: "sections".tr(),
          fontSize: 14,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 16.height),
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
    );
  }
}
