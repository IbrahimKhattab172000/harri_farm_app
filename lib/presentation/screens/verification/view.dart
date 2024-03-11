import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/app/widgets/app_button.dart';
import 'package:harri_farm_app/app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/app/widgets/app_pin_code_field.dart';
import 'package:harri_farm_app/app/widgets/app_text.dart';
import 'package:harri_farm_app/business_logic/helpers/colors.dart';
import 'package:harri_farm_app/business_logic/helpers/dimentions.dart';
import 'package:harri_farm_app/business_logic/helpers/utils.dart';
import 'package:harri_farm_app/business_logic/routing/routes.dart';
import 'package:harri_farm_app/presentation/screens/reset_password/view.dart';
part 'units/body.dart';
part 'widgets/resend_code.dart';
part 'units/image.dart';
part 'units/title.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

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
                const _Title(),
                SizedBox(height: 28.height),
                const _Image(),
                const _Body(),
                const _ResendWidget(),
                SizedBox(height: Utils.bottomDevicePadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
