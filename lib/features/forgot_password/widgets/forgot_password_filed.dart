import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class ForgotPasswordField extends StatelessWidget {
  const ForgotPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(label: "email_or_phone".tr());
  }
}
