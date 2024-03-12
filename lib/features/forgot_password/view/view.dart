import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/forgot_password/widgets/forgot_body.dart';
import 'package:harri_farm_app/features/forgot_password/widgets/image.dart';
import 'package:harri_farm_app/features/forgot_password/widgets/title.dart';
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
                const ForgotTitle(),
                SizedBox(height: 28.height),
                const ForgotImage(),
                const ForgotBody(),
                SizedBox(height: Utils.bottomDevicePadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
