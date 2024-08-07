import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class RateServiceField extends StatelessWidget {
  const RateServiceField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      maxLines: 6,
      hint: "add_your_notes_here".tr(),
      fillColor: AppColors.background,
      borderColor: AppColors.primary,
    );
  }
}
