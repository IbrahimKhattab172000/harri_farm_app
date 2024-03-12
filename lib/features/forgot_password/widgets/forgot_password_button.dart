import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/verification/view/view.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: "send_code".tr(),
      onTap: () {
        RouteUtils.navigateTo(const VerificationView());
      },
    );
  }
}
