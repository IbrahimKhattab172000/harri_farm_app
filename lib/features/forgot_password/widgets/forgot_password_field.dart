import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/forgot_password/bloc/forget_password_bloc.dart';
import 'package:harri_farm_app/helpers/validator.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class ForgotPasswordField extends StatelessWidget {
  const ForgotPasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = ForgetPasswordBloc.of(context);

    return Form(
      key: bloc.forgetPasswordFormKey,
      child: AppTextField(
        label: "email_or_phone".tr(),
        controller: bloc.emailOrPhone,
        validator: Validator.empty,
      ),
    );
  }
}
