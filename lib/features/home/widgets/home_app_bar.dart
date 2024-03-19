import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/cart/view/view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Image.asset(
            Utils.getAssetPNGPath("menu_icon"),
            width: 22.width,
          ),
        ),
        const Spacer(),
        Stack(
          clipBehavior: Clip.none,
          children: [
            InkWell(
              onTap: () {
                RouteUtils.navigateTo(const CartView());
              },
              child: Image.asset(
                Utils.getAssetPNGPath("shopping_icon"),
                width: 22.width,
              ),
            ),
            const Positioned(
              top: -5,
              right: -8,
              child: CircleAvatar(
                backgroundColor: AppColors.red,
                radius: 10,
                child: Center(
                  child: AppText(
                    textAlign: TextAlign.center,
                    title: "2",
                    fontSize: 10,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 15.width),
        Stack(
          children: [
            InkWell(
              onTap: () {},
              child: Image.asset(
                Utils.getAssetPNGPath("bell_icon"),
                width: 22.width,
              ),
            ),
            const Positioned(
              top: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 5,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
