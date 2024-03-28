import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/reset_password/widgets/reset_password_button.dart';
import 'package:harri_farm_app/features/reset_password/widgets/reset_password_forms.dart';
import 'package:harri_farm_app/features/reset_password/widgets/reset_password_note.dart';
import 'package:harri_farm_app/features/reset_password/widgets/rest_password_image.dart';
import 'package:harri_farm_app/features/reset_password/widgets/rest_password_title.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

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
                const RestPasswordImage(),
                SizedBox(height: 40.height),
                const RestPasswordTitle(),
                const ResetPasswordNote(),
                SizedBox(height: 40.height),
                const ResetPasswordForms(),
                SizedBox(height: 40.height),
                const ResetPasswordButton(),
                SizedBox(height: Utils.bottomDevicePadding + 22.height),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
