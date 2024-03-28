import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/register/bloc/register_bloc.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = RegisterBloc.of(context);

    return AppButton(
      title: "signup".tr(),
      onTap: () {
        if (bloc.formkey.currentState!.validate()) {
          bloc.add(Click());
        }
      },
    );
  }
}
