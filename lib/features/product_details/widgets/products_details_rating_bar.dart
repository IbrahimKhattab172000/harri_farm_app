import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/product_details/widgets/product_details_rating_card.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ProductDetailsRating extends StatelessWidget {
  const ProductDetailsRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppText(
              title: "ratings".tr(),
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: AppText(
                title: "show_all".tr(),
                fontSize: 12,
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Container(
          constraints: BoxConstraints(maxHeight: 360.height),
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return const ProductDetailsRatingCard();
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.height);
            },
          ),
        ),
      ],
    );
  }
}
