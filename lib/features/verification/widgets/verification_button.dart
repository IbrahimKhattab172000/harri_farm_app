import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/reset_password/view/reset_password_view.dart';
import 'package:harri_farm_app/features/verification/bloc/verification_bloc.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class VerificationButton extends StatelessWidget {
  const VerificationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = VerificationBloc.of(context);
    return AppButton(
      title: "continue".tr(),
      onTap: () {
        if (bloc.formKey.currentState!.validate()) {
          bloc.add(Click());
          RouteUtils.navigateTo(const ResetPasswordView());
        }
      },
    );
  }
}
