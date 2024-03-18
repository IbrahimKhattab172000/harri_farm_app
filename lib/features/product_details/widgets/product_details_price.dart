import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ProductDetailsPrice extends StatelessWidget {
  const ProductDetailsPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AppText(
          title: "170 SR",
          fontSize: 14,
          color: AppColors.lightGray,
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.lineThrough,
        ),
        SizedBox(width: 4.width),
        const AppText(
          title: "170 SR",
          fontSize: 14,
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
