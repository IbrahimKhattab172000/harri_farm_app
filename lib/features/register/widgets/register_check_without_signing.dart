import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class RegisterCheckWithoutSigning extends StatelessWidget {
  const RegisterCheckWithoutSigning({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: 'browse_without_logging_in'.tr(),
      color: AppColors.primary,
      fontSize: 16,
      fontWeight: FontWeight.w700,
    );
  }
}
