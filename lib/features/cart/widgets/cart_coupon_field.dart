import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class CartCouponField extends StatelessWidget {
  const CartCouponField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.lightGray.withOpacity(0.4),
      ),
      child: Row(
        children: [
          SizedBox(width: 12.width),
          Image.asset(
            Utils.getAssetPNGPath("coupon"),
            width: 24.width,
            height: 24.height,
            color: AppColors.gray,
          ),
          SizedBox(width: 8.width),
          Expanded(
            child: AppTextField(
              hint: "enter_the_discount_code".tr(),
              transperent: true,
              fillColor: Colors.transparent,
            ),
          ),
          SizedBox(width: 8.width),
          AppText(
            title: "activate".tr(),
            color: AppColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(width: 12.width),
        ],
      ),
    );
  }
}
