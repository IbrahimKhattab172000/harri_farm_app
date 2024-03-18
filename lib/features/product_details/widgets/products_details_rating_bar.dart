import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ProductDetailsRatingBar extends StatelessWidget {
  const ProductDetailsRatingBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          title: "ratings".tr(),
          fontSize: 16,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: AppText(
            title: "show_all".tr(),
            fontSize: 12,
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
