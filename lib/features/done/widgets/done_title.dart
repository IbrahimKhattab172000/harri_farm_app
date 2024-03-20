import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class DoneTitle extends StatelessWidget {
  const DoneTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: "your_order_sent_correctly".tr(),
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );
  }
}
