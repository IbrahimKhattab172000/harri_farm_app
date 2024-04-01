import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/cart/view/view.dart';
import 'package:harri_farm_app/features/home/view/home_view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class DoneButtons extends StatelessWidget {
  const DoneButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            title: "home".tr(),
            color: AppColors.lightGray,
            titleColor: AppColors.black,
            onTap: () {
              RouteUtils.navigateTo(const HomeView());
            },
            padding: const EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
        SizedBox(width: 20.width),
        Expanded(
          child: AppButton(
            title: "my_orders".tr(),
            color: AppColors.primary,
            titleColor: AppColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            onTap: () {
              RouteUtils.navigateTo(const CartView());
            },
          ),
        ),
      ],
    );
  }
}
