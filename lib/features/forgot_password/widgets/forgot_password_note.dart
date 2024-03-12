import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ForgotPasswordNote extends StatelessWidget {
  const ForgotPasswordNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: "forgot_password_note".tr(),
      color: AppColors.lightBlack,
      fontSize: 16,
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
