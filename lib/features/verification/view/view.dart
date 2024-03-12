import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/verification/widgets/verification_button.dart';
import 'package:harri_farm_app/features/verification/widgets/verification_image.dart';
import 'package:harri_farm_app/features/verification/widgets/resend_code.dart';
import 'package:harri_farm_app/features/verification/widgets/verification_note.dart';
import 'package:harri_farm_app/features/verification/widgets/verification_pin_code_fileld.dart';
import 'package:harri_farm_app/features/verification/widgets/verification_resend_text.dart';
import 'package:harri_farm_app/features/verification/widgets/verification_title.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

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
                const VerificationTitle(),
                SizedBox(height: 28.height),
                const VerificationImage(),
                const VerificationNote(),
                SizedBox(height: 20.height),
                const VerificationPinCodeField(),
                SizedBox(height: 20.height),
                const VerificationButton(),
                SizedBox(height: 20.height),
                const VerificationResendText(),
                const ResendWidget(),
                SizedBox(height: Utils.bottomDevicePadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
