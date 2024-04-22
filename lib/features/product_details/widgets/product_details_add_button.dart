import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/product_details/bloc/product_details_bloc.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ProductDetailsAddToCartButton extends StatelessWidget {
  const ProductDetailsAddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = ProductDetailsBloc.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 18),
      child: ElevatedButton(
        onPressed: () {
          bloc.add(
            Click(
              arguments: {
                "offer_id": bloc.productDetailsData.data?.offer?.id.toString(),
                "size_id": bloc.productDetailsData.data?.offer?.sizes?[0].id
                    .toString(),
              },
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: SizedBox(
          height: 66.height,
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
      ),
    );
  }
}
