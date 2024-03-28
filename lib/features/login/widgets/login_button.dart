import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/login/bloc/login_bloc.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = LoginBloc.of(context);
    return AppButton(
      title: "login".tr(),
      onTap: () {
        if (bloc.formKey.currentState!.validate()) {
          bloc.add(Click());
          // RouteUtils.navigateTo(const HomeView());
        } else {}
      },
    );
  }
}
