import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/app/widgets/app_button.dart';
import 'package:harri_farm_app/app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/app/widgets/app_text.dart';
import 'package:harri_farm_app/app/widgets/app_text_field.dart';
import 'package:harri_farm_app/business_logic/helpers/colors.dart';
import 'package:harri_farm_app/business_logic/helpers/dimentions.dart';
import 'package:harri_farm_app/business_logic/helpers/utils.dart';
import 'package:harri_farm_app/business_logic/routing/routes.dart';
import 'package:harri_farm_app/presentation/screens/verification/view.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppDecoratedBackGround(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Utils.topDevicePadding + 64.height),
                AppText(
                  title: 'forgot_password'.tr(),
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
                SizedBox(height: Utils.bottomDevicePadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
