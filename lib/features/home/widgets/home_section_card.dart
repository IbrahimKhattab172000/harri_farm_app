import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/sections/view/view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

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
    return InkWell(
      onTap: () {
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
      ),
    );
  }
}
