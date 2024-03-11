import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/app/widgets/app_button.dart';
import 'package:harri_farm_app/app/widgets/app_text.dart';
import 'package:harri_farm_app/app/widgets/app_text_field.dart';
import 'package:harri_farm_app/business_logic/helpers/colors.dart';
import 'package:harri_farm_app/business_logic/helpers/dimentions.dart';
import 'package:harri_farm_app/business_logic/helpers/utils.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: Utils.topDevicePadding + 64.height),
              Image.asset(
                Utils.getAssetPNGPath('splash'),
                width: 132.width,
                height: 132.height,
              ),
              SizedBox(height: 40.height),
              AppText(
                title: "resetting_the_password".tr(),
                color: AppColors.black,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
              SizedBox(height: 22.height),
              AppText(
                title: "reset_password_note".tr(),
                color: AppColors.gray,
                fontSize: 16,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.height),
              AppTextField(
                label: 'new_password'.tr(),
                secure: true,
                trailing: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: AppColors.lightGray,
                ),
              ),
              SizedBox(height: 10.height),
              AppTextField(
                label: 'confirm_new_password'.tr(),
                secure: true,
                trailing: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: AppColors.lightGray,
                ),
              ),
              SizedBox(height: 40.height),
              AppButton(
                title: "confirm".tr(),
                onTap: () {},
              ),
              SizedBox(height: Utils.bottomDevicePadding),
            ],
          ),
        ),
      ),
    );
  }
}
