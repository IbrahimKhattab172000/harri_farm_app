import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/app/widgets/app_button.dart';
import 'package:harri_farm_app/app/widgets/app_text.dart';
import 'package:harri_farm_app/app/widgets/app_text_field.dart';
import 'package:harri_farm_app/business_logic/helpers/colors.dart';
import 'package:harri_farm_app/business_logic/helpers/dimentions.dart';
import 'package:harri_farm_app/business_logic/helpers/utils.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Utils.topDevicePadding + 64.height),
              Image.asset(
                Utils.getAssetPNGPath('splash'),
                width: 132.width,
                height: 132.height,
              ),
              SizedBox(height: 20.height),
              AppText(
                title: "login".tr(),
                color: AppColors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: 30.height),
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
              SizedBox(height: 20.height),
              Align(
                alignment:
                    Utils.isAR ? Alignment.centerLeft : Alignment.centerRight,
                child: AppText(
                  title: 'forget_password'.tr(),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  textAlign: Utils.isAR ? TextAlign.left : TextAlign.right,
                  onTap: () {
                    // RouteUtils.navigateTo(ForgotPasswordView());
                  },
                ),
              ),
              SizedBox(height: 14.height),
              AppButton(
                title: "login".tr(),
                onTap: () {},
              ),
              SizedBox(height: 56.height),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    title: 'no_account'.tr(),
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(width: 5.width),
                  GestureDetector(
                    onTap: () {
                      // RouteUtils.navigateTo(SignUpView());
                    },
                    child: AppText(
                      title: 'create_new_account'.tr(),
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.height),
              AppText(
                title: 'browse_without_logging_in'.tr(),
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(height: Utils.bottomDevicePadding),
            ],
          ),
        ),
      ),
    );
  }
}
