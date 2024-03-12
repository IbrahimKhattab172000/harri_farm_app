import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/forgot_password/view/view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class LoginForgetPassword extends StatelessWidget {
  const LoginForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Utils.isAR ? Alignment.centerLeft : Alignment.centerRight,
      child: AppText(
        title: 'forget_password'.tr(),
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
        textAlign: Utils.isAR ? TextAlign.left : TextAlign.right,
        onTap: () {
          RouteUtils.navigateTo(const ForgotPasswordView());
        },
      ),
    );
  }
}
