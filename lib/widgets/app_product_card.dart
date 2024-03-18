import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/product_details/view/view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class AppProductCard extends StatelessWidget {
  const AppProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RouteUtils.navigateTo(const ProductDetailsView());
      },
      child: Container(
        // height: 240.height,
        width: 146.width,
        color: AppColors.background,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 18,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    Utils.getAssetPNGPath("offer_meat"),
                    height: 116.height,
                    width: 136.width,
                  ),
                  SizedBox(height: 10.height),
                  AppText(
                    title: "meat".tr(),
                    fontSize: 14,
                  ),
                  SizedBox(height: 10.height),
                  const AppText(
                    title: "فريش بيف استربس",
                    fontSize: 14,
                    color: AppColors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 10.height),
                  Row(
                    children: [
                      Row(
                        children: [
                          const AppText(
                            title: "170 SR",
                            fontSize: 14,
                            color: AppColors.lightGray,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.lineThrough,
                          ),
                          SizedBox(width: 4.width),
                          const AppText(
                            title: "170 SR",
                            fontSize: 14,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Image.asset(
                        Utils.getAssetPNGPath("shopping_icon"),
                        width: 20.width,
                        height: 20.height,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              child: Container(
                height: 35.height,
                width: 35.height,
                decoration: const BoxDecoration(
                  color: AppColors.red,
                  shape: BoxShape.circle,
                ),
                child: const Column(
                  children: [
                    AppText(
                      title: "10%",
                      fontSize: 8,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                    AppText(
                      title: "خصم",
                      fontSize: 8,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
