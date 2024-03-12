import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class VerificationTitle extends StatelessWidget {
  const VerificationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: 'reset_password'.tr(),
      color: AppColors.black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
  }
}
