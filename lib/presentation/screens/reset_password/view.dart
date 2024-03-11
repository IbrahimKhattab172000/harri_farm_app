import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/app/widgets/app_button.dart';
import 'package:harri_farm_app/app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/app/widgets/app_text.dart';
import 'package:harri_farm_app/app/widgets/app_text_field.dart';
import 'package:harri_farm_app/business_logic/helpers/colors.dart';
import 'package:harri_farm_app/business_logic/helpers/dimentions.dart';
import 'package:harri_farm_app/business_logic/helpers/utils.dart';
part 'units/body.dart';
part 'units/image.dart';
part 'units/title.dart';

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
                const _Image(),
                SizedBox(height: 40.height),
                const _Title(),
                const _Body(),
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
