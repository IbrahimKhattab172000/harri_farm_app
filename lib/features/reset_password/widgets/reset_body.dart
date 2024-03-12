import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_button.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class ResetBody extends StatelessWidget {
  const ResetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          title: "reset_password_note".tr(),
          color: AppColors.gray,
          fontSize: 16,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40.height),
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
        SizedBox(height: 40.height),
        AppButton(
          title: "confirm".tr(),
          onTap: () {},
        ),
      ],
    );
  }
}
