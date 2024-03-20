import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_product_card.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ProductDetailsSimilarProducts extends StatelessWidget {
  const ProductDetailsSimilarProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppText(
            title: "similar_products".tr(),
            fontSize: 16,
            color: AppColors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10.height),
        Container(
          constraints: BoxConstraints(maxHeight: 270.height),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AppProductCard(
                  onTap: () {},
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 24.width);
            },
          ),
        ),
        SizedBox(height: 20.height),
      ],
    );
  }
}
