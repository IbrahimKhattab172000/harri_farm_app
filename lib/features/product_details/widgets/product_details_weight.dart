import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ProductDetailsWeight extends StatelessWidget {
  const ProductDetailsWeight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          title: "${"weight".tr()} : ",
          fontSize: 16,
          color: AppColors.gray,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(width: 4.width),
        const AppText(
          title: " 60 كيلو",
          fontSize: 16,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
