import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/features/sections/bloc/tabs/cubit.dart';
import 'package:harri_farm_app/features/sections/widgets/sections_tab.dart';

class SectionsTabBars extends StatelessWidget {
  const SectionsTabBars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsCubit, TabsStates>(
      builder: (context, state) {
        final cubit = TabsCubit.of(context);

        return Row(
          children: [
            SectionsTab(
              isSelected: cubit.currentViewIndex == 0,
              title: "all".tr(),
              onTap: () => cubit.changeView(0),
            ),
            SectionsTab(
              isSelected: cubit.currentViewIndex == 1,
              title: 'minced'.tr(),
              onTap: () => cubit.changeView(1),
            ),
            SectionsTab(
              isSelected: cubit.currentViewIndex == 2,
              title: 'minced'.tr(),
              onTap: () => cubit.changeView(2),
            ),
            SectionsTab(
              isSelected: cubit.currentViewIndex == 3,
              title: 'kofta'.tr(),
              onTap: () => cubit.changeView(3),
            ),
          ],
        );
      },
    );
  }
}
