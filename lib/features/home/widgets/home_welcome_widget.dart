import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class HomeWelcomeWidget extends StatelessWidget {
  const HomeWelcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
