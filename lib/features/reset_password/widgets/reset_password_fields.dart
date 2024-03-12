import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class ResetPasswordFields extends StatelessWidget {
  const ResetPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          label: 'new_password'.tr(),
          secure: true,
          trailing: const Icon(
            Icons.remove_red_eye_outlined,
            color: AppColors.lightGray,
          ),
        ),
        SizedBox(height: 10.height),
        AppTextField(
          label: 'confirm_new_password'.tr(),
          secure: true,
          trailing: const Icon(
            Icons.remove_red_eye_outlined,
            color: AppColors.lightGray,
          ),
        ),
      ],
    );
  }
}
