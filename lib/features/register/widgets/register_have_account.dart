import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class RegisterHaveAccount extends StatelessWidget {
  const RegisterHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          title: 'have_account'.tr(),
          color: AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(width: 5.width),
        GestureDetector(
          onTap: () {
            RouteUtils.pop();
          },
          child: AppText(
            title: 'login'.tr(),
            color: AppColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
