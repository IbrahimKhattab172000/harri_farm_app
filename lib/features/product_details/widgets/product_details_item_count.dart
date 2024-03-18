// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ProductDetailsItemsCount extends StatefulWidget {
  const ProductDetailsItemsCount({Key? key}) : super(key: key);

  @override
  _ProductDetailsItemsCountState createState() =>
      _ProductDetailsItemsCountState();
}

class _ProductDetailsItemsCountState extends State<ProductDetailsItemsCount> {
  int itemCount = 1;

  void incrementCount() {
    setState(() {
      itemCount++;
    });
  }

  void decrementCount() {
    setState(() {
      if (itemCount > 1) {
        itemCount--;
      }
    });
  }

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
                GestureDetector(
                  onTap: incrementCount,
                  child: Container(
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
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 14,
                      ),
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
                  child: Center(
                    child: AppText(
                      title: itemCount.toString(),
                      color: AppColors.background,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(width: 6.width),
                GestureDetector(
                  onTap: decrementCount,
                  child: Container(
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
                    child: const Center(
                      child: Icon(
                        Icons.remove,
                        size: 14,
                      ),
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
