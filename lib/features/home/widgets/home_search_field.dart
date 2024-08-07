import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/search/view/view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppTextField(
        leading: const Icon(
          Icons.search,
          color: AppColors.lightGray,
        ),
        hint: "search_for_product".tr(),
        onTap: () {
          RouteUtils.navigateTo(const SearchView());
        },
      ),
    );
  }
}
