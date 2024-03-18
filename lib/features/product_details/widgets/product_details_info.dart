import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class ProductDetailsInfo extends StatefulWidget {
  const ProductDetailsInfo({
    Key? key,
  }) : super(key: key);

  @override
  @override
  State<ProductDetailsInfo> createState() => _ProductDetailsInfoState();
}

class _ProductDetailsInfoState extends State<ProductDetailsInfo> {
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
        // Product Image
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            Utils.getAssetPNGPath("product_details_image"),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 16.height),

        // Product Items Count
        Column(
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
        SizedBox(height: 16.height),

        // Product Price
        Row(
          children: [
            const AppText(
              title: "170 SR",
              fontSize: 14,
              color: AppColors.lightGray,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.lineThrough,
            ),
            SizedBox(width: 4.width),
            const AppText(
              title: "170 SR",
              fontSize: 14,
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        SizedBox(height: 16.height),

        // Product Type
        Row(
          children: [
            AppText(
              title: "${"type".tr()} : ",
              fontSize: 16,
              color: AppColors.gray,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(width: 4.width),
            const AppText(
              title: "الطليان",
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        SizedBox(height: 16.height),

        // Product Weight
        Row(
          children: [
            AppText(
              title: "${"weight".tr()} : ",
              fontSize: 16,
              color: AppColors.gray,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(width: 4.width),
            const AppText(
              title: " 60 كيلو",
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        SizedBox(height: 16.height),

        // Product Description
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              title: "describtion".tr(),
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 16.height),
            const AppText(
              title:
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى أيضا",
              fontSize: 16,
              color: AppColors.gray,
              fontWeight: FontWeight.w500,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
