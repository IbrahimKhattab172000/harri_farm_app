import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/forgot_password/bloc/forget_password_bloc.dart';
import 'package:harri_farm_app/features/verification/view/verification_view.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = ForgetPasswordBloc.of(context);
    return AppButton(
      title: "send_code".tr(),
      onTap: () {
        if (bloc.formKey.currentState!.validate()) {
          bloc.add(Click());
          RouteUtils.navigateTo(const VerificationView());
        }
      },
    );
  }
}
