import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class RateServiceButton extends StatelessWidget {
  const RateServiceButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: "continue".tr(),
      onTap: () {},
    );
  }
}
