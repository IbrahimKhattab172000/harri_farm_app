import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class HomeOffersBar extends StatelessWidget {
  const HomeOffersBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
