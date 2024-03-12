import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ForgotTitle extends StatelessWidget {
  const ForgotTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: 'forgot_password'.tr(),
      color: AppColors.black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
  }
}
