import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class AccountSettingsForms extends StatelessWidget {
  const AccountSettingsForms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          label: "name".tr(),
          hint: "محمد الحديدي",
        ),
        SizedBox(height: 24.height),
        AppTextField(
          label: "phone_number".tr(),
          inputType: TextInputType.number,
        ),
        SizedBox(height: 24.height),
        AppTextField(
          label: "email".tr(),
        ),
        SizedBox(height: 24.height),
        AppTextField(
          label: "password".tr(),
        ),
      ],
    );
  }
}
