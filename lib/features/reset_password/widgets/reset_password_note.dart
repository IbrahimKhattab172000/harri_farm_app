import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ResetPasswordNote extends StatelessWidget {
  const ResetPasswordNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: "reset_password_note".tr(),
      color: AppColors.gray,
      fontSize: 16,
      textAlign: TextAlign.center,
    );
  }
}
