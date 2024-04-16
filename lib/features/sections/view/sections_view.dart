import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/sections/bloc/sections_bloc.dart';
import 'package:harri_farm_app/features/sections/widgets/section_app_bar.dart';
import 'package:harri_farm_app/features/sections/widgets/sections_grid_items.dart';
import 'package:harri_farm_app/features/sections/widgets/sections_section_title.dart';
import 'package:harri_farm_app/features/sections/widgets/sections_tab_bar.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class SectionsView extends StatelessWidget {
  const SectionsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SectionsAppBar(),
      body: AppDecoratedBackGround(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<SectionBloc, AppState>(
            builder: (context, state) {
              if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is Error) {
                return Center(child: AppText(title: 'error_loading_data'.tr()));
              } else {
                SectionBloc bloc = SectionBloc.of(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.height),
                    SectionsSectionTitle(
                        title: bloc.subCategoryData.data!.name),
                    SizedBox(height: 16.height),
                    SectionsTabBars(
                      subCategory: bloc.subCategoryData.data!.subCategory,
                      isFiltering: false,
                    ),
                    SizedBox(height: 32.height),
                    const SectionGridItems(),
                    SizedBox(height: Utils.bottomDevicePadding),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
