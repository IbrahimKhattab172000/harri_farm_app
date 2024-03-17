import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/features/sections/bloc/tabs/cubit.dart';
import 'package:harri_farm_app/features/sections/widgets/section_app_bar.dart';
import 'package:harri_farm_app/features/sections/widgets/sections_grid_items.dart';
import 'package:harri_farm_app/features/sections/widgets/sections_section_title.dart';
import 'package:harri_farm_app/features/sections/widgets/sections_tab_bar.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';

class SectionsView extends StatelessWidget {
  const SectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabsCubit(),
      child: AppDecoratedBackGround(
        child: Scaffold(
          appBar: const SectionsAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.height),
                const SectionsSectionTitle(),
                SizedBox(height: 16.height),
                const SectionsTabBars(),
                SizedBox(height: 32.height),
                const SectionGridItems(),
                SizedBox(height: Utils.bottomDevicePadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
