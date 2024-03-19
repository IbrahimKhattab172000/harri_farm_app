import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class CartButtons extends StatelessWidget {
  const CartButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            title: "back_to_shopping".tr(),
            color: AppColors.lightGray,
            titleColor: AppColors.black,
            onTap: () {},
            padding: const EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
        SizedBox(width: 10.width),
        Expanded(
          child: AppButton(
            title: "confirm_order".tr(),
            color: AppColors.primary,
            titleColor: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
