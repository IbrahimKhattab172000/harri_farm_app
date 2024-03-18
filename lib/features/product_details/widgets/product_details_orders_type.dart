import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_toggle.dart';

class ProductDetailsOrderType extends StatelessWidget {
  const ProductDetailsOrderType({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: "order_type".tr(),
          fontSize: 16,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 16.height),
        const AppToggleCard(
          title: "ذبيحه غير مطبوخه",
          isSelected: true,
        ),
        const AppToggleCard(
          title: "لا  شئ",
          isSelected: false,
        ),
      ],
    );
  }
}
