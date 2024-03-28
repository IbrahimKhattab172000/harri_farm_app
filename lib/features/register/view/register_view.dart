import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/register/widgets/register_button.dart';
import 'package:harri_farm_app/features/register/widgets/register_check_without_signing.dart';
import 'package:harri_farm_app/features/register/widgets/register_forms.dart';
import 'package:harri_farm_app/features/register/widgets/register_have_account.dart';
import 'package:harri_farm_app/features/register/widgets/register_terms_conditions.dart';
import 'package:harri_farm_app/features/register/widgets/register_title.dart';
import 'package:harri_farm_app/widgets/app_cistom_image.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                const RegisterTitle(),
                SizedBox(height: 30.height),
                const RegisterForms(),
                SizedBox(height: 26.height),
                const RegisterTermAndConditions(),
                SizedBox(height: 44.height),
                const RegisterButton(),
                SizedBox(height: 8.height),
                const RegisterHaveAccount(),
                SizedBox(height: 14.height),
                const RegisterCheckWithoutSigning(),
                SizedBox(height: Utils.bottomDevicePadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
