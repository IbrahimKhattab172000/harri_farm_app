import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class MyOrderDetailsHeader extends StatelessWidget {
  final String orderType;
  const MyOrderDetailsHeader({
    super.key,
    required this.orderType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            Utils.getAssetPNGPath("order_details"),
            width: 80.width,
            height: 65.height,
          ),
        ),
        SizedBox(height: 8.height),
        AppText(
          title: "total_sum".tr(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          color: AppColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        SizedBox(height: 4.height),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppText(
              title: 'SR',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            SizedBox(width: 4.width),
            const AppText(
              title: '150.00',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ],
        ),
        SizedBox(height: 4.height),
        AppText(
          title: orderType.tr(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          color: orderType == "rejected" ? AppColors.red : AppColors.primary,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
