import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class SectionsSectionTitle extends StatelessWidget {
  const SectionsSectionTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: "meat".tr(),
      fontSize: 14,
      color: AppColors.black,
      fontWeight: FontWeight.w500,
    );
  }
}
