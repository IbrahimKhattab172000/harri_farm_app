import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class AboutUsCard extends StatelessWidget {
  final String title;
  final String body;
  const AboutUsCard({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: title.tr(),
          fontSize: 20,
          color: AppColors.primary,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 8.height),
        AppText(
          title: body,
          fontSize: 16,
          color: AppColors.black,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
