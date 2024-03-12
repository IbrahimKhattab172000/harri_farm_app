import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/forgot_password/widgets/forgot_password_button.dart';
import 'package:harri_farm_app/features/forgot_password/widgets/forgot_password_filed.dart';
import 'package:harri_farm_app/features/forgot_password/widgets/forgot_password_note.dart';
import 'package:harri_farm_app/features/forgot_password/widgets/forgot_password_image.dart';
import 'package:harri_farm_app/features/forgot_password/widgets/forgot_password_title.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

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
                const ForgotPasswordTitle(),
                SizedBox(height: 28.height),
                const ForgotPasswordImage(),
                const ForgotPasswordNote(),
                SizedBox(height: 40.height),
                const ForgotPasswordField(),
                SizedBox(height: 40.height),
                const ForgotPasswordButton(),
                SizedBox(height: Utils.bottomDevicePadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
