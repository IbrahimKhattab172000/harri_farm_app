import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class SectionsSectionTitle extends StatelessWidget {
  final String? title;
  const SectionsSectionTitle({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: title ?? "",
      fontSize: 18,
      color: AppColors.black,
      fontWeight: FontWeight.w700,
    );
  }
}
