import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class AppEmptyScreen extends StatelessWidget {
  final String title;
  const AppEmptyScreen({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Utils.getAssetPNGPath("empty_notifications"),
          height: 210.height,
          width: double.infinity,
        ),
        SizedBox(height: 8.height),
        AppText(
          title: title.tr(),
          color: AppColors.darkGray,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        )
      ],
    );
  }
}
