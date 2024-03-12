import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/reset_password/view/view.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class VerificationButton extends StatelessWidget {
  const VerificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: "continue".tr(),
      onTap: () {
        RouteUtils.navigateTo(const ResetPasswordView());
      },
    );
  }
}
