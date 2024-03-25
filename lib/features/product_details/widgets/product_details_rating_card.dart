import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ProductDetailsRatingCard extends StatelessWidget {
  const ProductDetailsRatingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
        ),
        // height: 136.height,
        width: 344.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(Utils.getAssetPNGPath("rate")),
                ),
                SizedBox(width: 16.width),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText(
                      title: "منال الخالدي",
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 20,
                          color: AppColors.yellow,
                        ),
                        SizedBox(width: 8.width),
                        const AppText(
                          title: "4.5",
                          color: AppColors.yellow,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const AppText(
                  title: "2023 / 6 / 1",
                  fontSize: 14,
                  color: AppColors.gray,
                ),
              ],
            ),
            SizedBox(height: 16.height),
            AppText(
              title: "dummy_text".tr(),
              fontSize: 14,
              color: Colors.black,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
