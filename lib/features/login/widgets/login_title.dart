import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: "login".tr(),
      color: AppColors.black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
  }
}
