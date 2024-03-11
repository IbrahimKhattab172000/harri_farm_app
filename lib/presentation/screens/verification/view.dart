import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/app/widgets/app_button.dart';
import 'package:harri_farm_app/app/widgets/app_pin_code_field.dart';
import 'package:harri_farm_app/app/widgets/app_text.dart';
import 'package:harri_farm_app/business_logic/helpers/colors.dart';
import 'package:harri_farm_app/business_logic/helpers/dimentions.dart';
import 'package:harri_farm_app/business_logic/helpers/utils.dart';
import 'package:harri_farm_app/business_logic/routing/routes.dart';
import 'package:harri_farm_app/presentation/screens/reset_password/view.dart';
import 'package:harri_farm_app/presentation/screens/verification/widgets/resend_code.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Utils.topDevicePadding + 64.height),
              AppText(
                title: 'reset_password'.tr(),
                color: AppColors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 28.height),
              SizedBox(
                height: 300.height,
                width: 300.width,
                child: Center(
                  child: Image.asset(
                    Utils.getAssetPNGPath("forget_password"),
                  ),
                ),
              ),
              AppText(
                title: "forgot_password_note".tr(),
                color: const Color.fromRGBO(59, 59, 59, 1),
                fontSize: 16,
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 40.height),
              AppPinCodeField(
                onChanged: (code) {},
              ),
              SizedBox(height: 40.height),
              AppButton(
                title: "continue".tr(),
                onTap: () {
                  RouteUtils.navigateTo(const ResetPasswordView());
                },
              ),
              SizedBox(height: 40.height),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    title: "didnt_recive_the_code".tr(),
                    color: AppColors.black,
                    fontSize: 16,
                  ),
                  SizedBox(width: 4.width),
                  AppText(
                    title: "resending_in".tr(),
                    color: AppColors.primary,
                    fontSize: 16,
                  ),
                  SizedBox(width: 4.width),
                  const ResendWidget(),
                ],
              ),
              SizedBox(height: Utils.bottomDevicePadding),
            ],
          ),
        ),
      ),
    );
  }
}
