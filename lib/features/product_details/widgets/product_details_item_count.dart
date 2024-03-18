import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ProductDetailsItemsCount extends StatelessWidget {
  const ProductDetailsItemsCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: "meat".tr(),
          fontSize: 12,
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 8.height),
        Row(
          children: [
            const AppText(
              title: "فريش بيف استربس",
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  height: 32.height,
                  width: 38.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.background,
                    border: Border.all(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        size: 14,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(width: 6.width),
                Container(
                  height: 32.height,
                  width: 42.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.primary,
                  ),
                  child: const Center(
                    child: AppText(
                      title: "1",
                      color: AppColors.background,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(width: 6.width),
                Container(
                  height: 32.height,
                  width: 38.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.background,
                    border: Border.all(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.remove,
                        size: 14,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
