import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class NotificationCard extends StatelessWidget {
  final String title;

  final String dateTime;
  const NotificationCard({
    super.key,
    required this.title,
    required this.dateTime,
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
              title: title,
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 8.height),
            AppText(
              title: dateTime,
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
