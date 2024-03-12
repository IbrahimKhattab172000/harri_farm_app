import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class RestTitle extends StatelessWidget {
  const RestTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: "resetting_the_password".tr(),
      color: AppColors.black,
      fontWeight: FontWeight.w700,
      fontSize: 20,
    );
  }
}
