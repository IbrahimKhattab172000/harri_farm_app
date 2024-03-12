import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/features/verification/view/view.dart';
import 'package:harri_farm_app/widgets/app_button.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class ForgotBody extends StatelessWidget {
  const ForgotBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          title: "forgot_password_note".tr(),
          color: AppColors.lightBlack,
          fontSize: 16,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 40.height),
        AppTextField(label: "email_or_phone".tr()),
        SizedBox(height: 40.height),
        AppButton(
          title: "send_code".tr(),
          onTap: () {
            RouteUtils.navigateTo(const VerificationView());
          },
        ),
      ],
    );
  }
}
