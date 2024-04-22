import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/cart/view/cart_view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ProductDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailsAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppAppBar(
      leading: InkWell(
        onTap: () => RouteUtils.pop(),
        child: const Icon(
          Icons.arrow_back_ios,
          size: 18,
        ),
      ),
      title: "product_details".tr(),
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Stack(
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
        ),
      ],
    );
  }
}
