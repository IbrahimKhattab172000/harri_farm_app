import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/sections/bloc/sections_bloc.dart';
import 'package:harri_farm_app/features/sections/view/sections_view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class HomeSectionCard extends StatelessWidget {
  final Color color;
  final String imagePath;
  final String name;
  final String catId;

  const HomeSectionCard({
    Key? key,
    required this.color,
    required this.imagePath,
    required this.name,
    required this.catId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        SectionBloc.of(context).add(Get(arguments: catId));

        RouteUtils.navigateTo(const SectionsView());
      },
      child: Container(
        width: 74.width,
        height: 88.height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10000),
              child: Container(
                width: 44.width,
                height: 44.width,
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColors.white,
                    backgroundImage: NetworkImage(imagePath),
                  ),
                ),
              ),
            ),
            SizedBox(height: 4.height),
            AppText(
              title: name.tr(),
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
