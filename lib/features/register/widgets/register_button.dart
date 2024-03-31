import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/register/bloc/register_bloc.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = RegisterBloc.of(context);

    return BlocBuilder<RegisterBloc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return AppButton(
            title: "signup".tr(),
            onTap: () {
              bloc.add(Click());
            },
          );
        }
      },
    );
  }
}
