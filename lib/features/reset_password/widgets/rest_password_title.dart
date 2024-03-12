import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class RestPasswordTitle extends StatelessWidget {
  const RestPasswordTitle({super.key});

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
