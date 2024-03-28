import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/login/bloc/login_bloc.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/validator.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class LoginForms extends StatefulWidget {
  const LoginForms({super.key});

  @override
  State<LoginForms> createState() => _LoginFormsState();
}

class _LoginFormsState extends State<LoginForms> {
  bool isPasswordSecure = true;
  @override
  Widget build(BuildContext context) {
    final bloc = LoginBloc.of(context);

    return Column(
      children: [
        AppTextField(
          label: "email_or_phone".tr(),
          controller: bloc.emailOrPhone,
          validator: Validator.empty,
        ),
        SizedBox(height: 10.height),
        AppTextField(
          label: 'password'.tr(),
          controller: bloc.password,
          validator: Validator.password,
          secure: isPasswordSecure,
          trailing: InkWell(
            onTap: () {
              setState(() {
                isPasswordSecure = !isPasswordSecure;
              });
            },
            child: Icon(
              isPasswordSecure
                  ? Icons.remove_red_eye
                  : Icons.remove_red_eye_outlined,
              color: AppColors.lightGray,
            ),
          ),
        ),
      ],
    );
  }
}
