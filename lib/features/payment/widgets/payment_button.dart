import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/done/view/view.dart';
import 'package:harri_farm_app/features/payment/bloc/payment_bloc.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: "confirm_order".tr(),
      onTap: () {
        PaymentBloc.of(context).add(Add());
        RouteUtils.navigateTo(const DoneView());
      },
    );
  }
}
