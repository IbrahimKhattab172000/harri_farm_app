import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/features/search/bloc/search_bloc.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class SearchSearchField extends StatelessWidget {
  const SearchSearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = SearchBloc.of(context);
    return Form(
      key: bloc.searchFormKey,
      child: AppTextField(
        controller: bloc.searchController,
        onChanged: (value) {
          bloc.add(Get());
        },
        leading: const Icon(
          Icons.search,
          color: AppColors.lightGray,
        ),
        hint: "search_for_product".tr(),
      ),
    );
  }
}
