import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/reset_password/widgets/image.dart';
import 'package:harri_farm_app/features/reset_password/widgets/reset_body.dart';
import 'package:harri_farm_app/features/reset_password/widgets/title.dart';
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
                const RestImage(),
                SizedBox(height: 40.height),
                const RestTitle(),
                const ResetBody(),
                SizedBox(height: 22.height),
                SizedBox(height: Utils.bottomDevicePadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
