import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/register/bloc/register_bloc.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/validator.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class RegisterForms extends StatefulWidget {
  const RegisterForms({super.key});

  @override
  State<RegisterForms> createState() => _RegisterFormsState();
}

class _RegisterFormsState extends State<RegisterForms> {
  bool isPasswordSecure = true;
  bool isPasswordConfirmationSecure = true;

  @override
  Widget build(BuildContext context) {
    final bloc = RegisterBloc.of(context);
    return Form(
      key: bloc.registerFormKey,
      child: Column(
        children: [
          AppTextField(
            label: "name".tr(),
            controller: bloc.name,
            validator: Validator.name,
          ),
          SizedBox(height: 10.height),
          AppTextField(
            label: "phone".tr(),
            controller: bloc.phone,
            validator: Validator.phone,
            inputType: TextInputType.number,
          ),
          SizedBox(height: 10.height),
          AppTextField(
            label: "email".tr(),
            controller: bloc.email,
            validator: Validator.email,
          ),
          SizedBox(height: 10.height),
          AppTextField(
            label: 'password'.tr(),
            secure: isPasswordSecure,
            trailing: InkWell(
              onTap: () {
                isPasswordSecure = !isPasswordSecure;
                setState(() {});
              },
              child: Icon(
                isPasswordSecure
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined,
                color: AppColors.lightGray,
              ),
            ),
            controller: bloc.password,
            validator: Validator.password,
          ),
          SizedBox(height: 10.height),
          AppTextField(
            controller: bloc.passwordConfirmation,
            label: 'confirm_password'.tr(),
            secure: isPasswordConfirmationSecure,
            trailing: InkWell(
              onTap: () {
                isPasswordConfirmationSecure = !isPasswordConfirmationSecure;
                setState(() {});
              },
              child: Icon(
                isPasswordConfirmationSecure
                    ? Icons.remove_red_eye
                    : Icons.remove_red_eye_outlined,
                color: AppColors.lightGray,
              ),
            ),
            validator: (value) {
              final password = bloc.password.text;
              if (value == null || value.isEmpty) {
                return 'Please enter your password confirmation';
              }
              if (value != password) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
