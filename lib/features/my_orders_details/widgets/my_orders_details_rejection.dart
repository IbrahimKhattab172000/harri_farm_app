import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class MyOrdersDetailsRejection extends StatelessWidget {
  const MyOrdersDetailsRejection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: "rejection_reason".tr(),
          color: AppColors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 8.height),
        const Divider(thickness: 1, color: AppColors.lightGray),
        SizedBox(height: 8.height),
        AppText(
          title: "dummy_text".tr(),
          maxLines: 5,
          color: AppColors.black,
        ),
      ],
    );
  }
}
