import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class AccountSettingsButtons extends StatelessWidget {
  const AccountSettingsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          title: "save_changes".tr(),
          onTap: () {},
        ),
        SizedBox(height: 14.height),
        AppButton(
          title: "delete_account".tr(),
          color: AppColors.lightGray,
          titleColor: AppColors.black,
          onTap: () {},
        ),
      ],
    );
  }
}
