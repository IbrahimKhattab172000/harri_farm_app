import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/home/bloc/home_bloc.dart';
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
    final bloc = HomeBloc.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppText(
            title: "sections".tr(),
            fontSize: 14,
            color: AppColors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 16.height),
        SizedBox(
          height: 88.height,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: bloc.homeData.category?.length ?? 0,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              String colorString = bloc.homeData.category![index].color!;
              int colorValue = int.parse(colorString.substring(1), radix: 16);
              Color color = Color(0xFF000000 + colorValue);
              return HomeSectionCard(
                color: color,
                catId: bloc.homeData.category![index].id.toString(),
                imagePath: bloc.homeData.category![index].image as String,
                name: bloc.homeData.category![index].name as String,
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
