import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class SearchMainTitle extends StatelessWidget {
  const SearchMainTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: "search_for_your_products_here".tr(),
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    );
  }
}
