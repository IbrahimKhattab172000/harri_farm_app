import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/reset_password/bloc/reset_password_bloc.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = ResetPasswordBloc.of(context);
    return BlocBuilder<ResetPasswordBloc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        } else {
          return AppButton(
            title: "confirm".tr(),
            onTap: () {
              bloc.add(Click());
            },
          );
        }
      },
    );
  }
}
