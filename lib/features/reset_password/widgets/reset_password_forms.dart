import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/reset_password/bloc/reset_password_bloc.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class ResetPasswordForms extends StatefulWidget {
  const ResetPasswordForms({super.key});

  @override
  State<ResetPasswordForms> createState() => _ResetPasswordFormsState();
}

class _ResetPasswordFormsState extends State<ResetPasswordForms> {
  bool isPasswordSecure = true;
  bool isPasswordConfirmationSecure = true;

  @override
  Widget build(BuildContext context) {
    final bloc = ResetPasswordBloc.of(context);
    return Form(
      key: bloc.formKey,
      child: Column(
        children: [
          AppTextField(
            label: 'new_password'.tr(),
            controller: bloc.password,
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
          ),
          SizedBox(height: 10.height),
          AppTextField(
            label: 'confirm_new_password'.tr(),
            controller: bloc.confirmPassword,
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
