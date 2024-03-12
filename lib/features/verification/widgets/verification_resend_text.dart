import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class VerificationResendText extends StatelessWidget {
  const VerificationResendText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          title: "didnt_recive_the_code".tr(),
          color: AppColors.black,
          fontSize: 16,
        ),
        SizedBox(width: 4.width),
        AppText(
          title: "resending_in".tr(),
          color: AppColors.primary,
          fontSize: 16,
        ),
        SizedBox(width: 4.width),
      ],
    );
  }
}
