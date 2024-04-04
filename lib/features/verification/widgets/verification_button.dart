import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/verification/bloc/verification_bloc.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class VerificationButton extends StatelessWidget {
  final bool? isVerified;
  const VerificationButton({
    super.key,
    this.isVerified,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = VerificationBloc.of(context);
    return BlocBuilder<VerificationBloc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        } else {
          return AppButton(
            title: "continue".tr(),
            onTap: () {
              bloc.add(Click(arguments: isVerified));
            },
          );
        }
      },
    );
  }
}
