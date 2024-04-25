import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/payment/bloc/payment_bloc.dart';
import 'package:harri_farm_app/features/payment/view/view.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_button.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class ShippingAddressButton extends StatelessWidget {
  const ShippingAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = PaymentBloc.of(context);
    return AppButton(
      title: "next".tr(),
      onTap: () {
        if (!bloc.paymentFormKey.currentState!.validate() ||
            bloc.addressId == null) {
          showSnackBar(
              bloc.addressId == null ? "add_address".tr() : "empty_fields",
              errorMessage: false);
        } else {
          RouteUtils.navigateTo(const PaymentView());
        }
      },
    );
  }
}
