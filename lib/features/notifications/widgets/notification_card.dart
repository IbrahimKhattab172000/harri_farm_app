import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          Utils.getAssetPNGPath("notification_bell"),
          height: 22.height,
          width: 22.width,
        ),
        SizedBox(width: 14.width),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              title: "your_order_has_been_accepted_and_in_process".tr(),
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 8.height),
            const AppText(
              title: "3:50 PM",
              color: AppColors.gray,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ],
    );
  }
}
