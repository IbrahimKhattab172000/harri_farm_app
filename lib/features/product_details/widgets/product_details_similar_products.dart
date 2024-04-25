import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/product_details/models/product_details_model.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_similar_product_card.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ProductDetailsSimilarProducts extends StatelessWidget {
  final ProductDetailsModel product;

  const ProductDetailsSimilarProducts({
    super.key,
    required this.product,
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: product.data?.offer?.similarProduct?.length ?? 0,
            itemBuilder: (context, index) {
              return AppSimilarProductCard(
                similarProduct: product.data?.offer?.similarProduct?[index],
                isFavorite:
                    product.data?.offer?.similarProduct?[index].like ?? false,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 16.width);
            },
          ),
        ),
        SizedBox(height: 20.height),
      ],
    );
  }
}
