import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/cart/widgets/cart_card.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class CartProudcts extends StatelessWidget {
  const CartProudcts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppText(
              title: "3 ${"products".tr()}",
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            const Spacer(),
            AppText(
              title: "delete_cart".tr(),
              color: AppColors.primary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CartCard(
              onCountChanged: (int count) {},
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 10.height);
          },
        ),
      ],
    );
  }
}
