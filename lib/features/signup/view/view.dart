import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/signup/widgets/signup_button.dart';
import 'package:harri_farm_app/features/signup/widgets/signup_check_without_signing.dart';
import 'package:harri_farm_app/features/signup/widgets/signup_forms.dart';
import 'package:harri_farm_app/features/signup/widgets/signup_have_account.dart';
import 'package:harri_farm_app/features/signup/widgets/signup_terms_conditions.dart';
import 'package:harri_farm_app/features/signup/widgets/signup_title.dart';
import 'package:harri_farm_app/widgets/app_cistom_image.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppDecoratedBackGround(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: Utils.topDevicePadding + 64.height),
                const AppCustomImage(),
                SizedBox(height: 20.height),
                const SignUpTitle(),
                SizedBox(height: 30.height),
                const SignUpForms(),
                SizedBox(height: 26.height),
                const SignUpTermAndConditions(),
                SizedBox(height: 44.height),
                const SignUpButton(),
                SizedBox(height: 8.height),
                const SignupHaveAccount(),
                SizedBox(height: 14.height),
                const SignUpCheckWithoutSigning(),
                SizedBox(height: Utils.bottomDevicePadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
