import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/search/widgets/search_app_bar.dart';
import 'package:harri_farm_app/features/search/widgets/search_field.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBar(),
      body: AppDecoratedBackGround(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32.height),
              AppText(
                title: "search_for_your_products_here".tr(),
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
              SizedBox(height: 16.height),
              const SearchSearchField()
            ],
          ),
        ),
      ),
    );
  }
}
