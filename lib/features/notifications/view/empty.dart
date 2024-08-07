import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class NotificationsEmpty extends StatelessWidget {
  const NotificationsEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.height),
        Image.asset(
          Utils.getAssetPNGPath("empty_notifications"),
          height: 210.height,
          width: double.infinity,
        ),
        SizedBox(height: 24.height),
        AppText(
          title: "no_notifications_start_using_the_app".tr(),
          color: AppColors.darkGray,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        )
      ],
    );
  }
}
