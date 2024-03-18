import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ProductDetailsAddToCartButton extends StatelessWidget {
  const ProductDetailsAddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Ink(
        height: 66.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                Utils.getAssetPNGPath("shopping_icon"),
                color: AppColors.white,
                height: 16,
                width: 16,
              ),
              SizedBox(width: 12.width),
              AppText(
                title: "add_to_cart".tr(),
                fontSize: 16,
                color: Colors.white,
              ),
              const Spacer(),
              const AppText(
                title: "150 ر.س",
                fontSize: 16,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
