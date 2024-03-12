import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(label: "email_or_phone".tr()),
        SizedBox(height: 10.height),
        AppTextField(
          label: 'password'.tr(),
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
