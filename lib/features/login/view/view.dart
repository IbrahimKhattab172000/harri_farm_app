import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/login/widgets/login_button.dart';
import 'package:harri_farm_app/features/login/widgets/login_check_without_logging.dart';
import 'package:harri_farm_app/features/login/widgets/login_fields.dart';
import 'package:harri_farm_app/features/login/widgets/login_forget_password.dart';
import 'package:harri_farm_app/features/login/widgets/login_no_account.dart';
import 'package:harri_farm_app/features/login/widgets/login_title.dart';
import 'package:harri_farm_app/widgets/app_button.dart';
import 'package:harri_farm_app/widgets/app_cistom_image.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/features/forgot_password/view/view.dart';
import 'package:harri_farm_app/features/signup/view/view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                const LoginTitle(),
                SizedBox(height: 30.height),
                const LoginFields(),
                SizedBox(height: 20.height),
                const LoginForgetPassword(),
                SizedBox(height: 14.height),
                const LoginButton(),
                SizedBox(height: 56.height),
                const LoginNoAccount(),
                SizedBox(height: 14.height),
                const LoginCheckWithoutLogging(),
                SizedBox(height: Utils.bottomDevicePadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
