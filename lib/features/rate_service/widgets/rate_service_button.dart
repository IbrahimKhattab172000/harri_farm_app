import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/rate_service/bloc/rate_service_bloc.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class RateServiceButton extends StatelessWidget {
  final String orderId;
  const RateServiceButton({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RateServiceBloc, AppState>(
      builder: (context, state) {
        if (state is Loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return AppButton(
            title: "continue".tr(),
            onTap: () {
              RateServiceBloc.of(context).add(Click(arguments: orderId));
            },
          );
        }
      },
    );
  }
}
