import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class MyOrdersCard extends StatelessWidget {
  final VoidCallback onTap;
  final String orderType;

  const MyOrdersCard({
    Key? key,
    required this.onTap,
    required this.orderType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 125.height,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  Utils.getAssetPNGPath("cart_item"),
                  width: 94.width,
                  height: 94.height,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppText(
                        title: "order_number".tr(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      SizedBox(width: 4.width),
                      const AppText(
                        title: "# 28102022",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  SizedBox(height: 4.height),
                  AppText(
                    title: "dummy_product_name".tr(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.gray,
                    fontSize: 12,
                  ),
                  SizedBox(height: 4.height),
                  const AppText(
                    title: ' 20/12/2022 الساعة 5:32 م',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.gray,
                    fontSize: 12,
                  ),
                  SizedBox(height: 4.height),
                  Row(
                    children: [
                      const AppText(
                        title: 'SR',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.gray,
                        fontSize: 12,
                      ),
                      SizedBox(width: 10.width),
                      const AppText(
                        title: '150.00',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.gray,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            AppText(
              title: orderType.tr(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              color: AppColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
