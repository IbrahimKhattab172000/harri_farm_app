import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/payment/view/view.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class ShippingAddressButton extends StatelessWidget {
  const ShippingAddressButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: "next".tr(),
      onTap: () {
        RouteUtils.navigateTo(const PaymentView());
      },
    );
  }
}
