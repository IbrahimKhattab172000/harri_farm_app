import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/home/view/view.dart';
import 'package:harri_farm_app/features/reset_password/bloc/reset_password_bloc.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = ResetPasswordBloc.of(context);
    return AppButton(
      title: "confirm".tr(),
      onTap: () {
        if (bloc.formKey.currentState!.validate()) {
          bloc.add(Click());
          RouteUtils.navigateTo(const HomeView());
        }
      },
    );
  }
}
