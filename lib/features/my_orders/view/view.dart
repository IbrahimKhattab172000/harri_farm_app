// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/features/my_orders/bloc/tab_cubit/cubit.dart';
import 'package:harri_farm_app/features/my_orders/widgets/my_orders_current_items_tab.dart';
import 'package:harri_farm_app/features/my_orders/widgets/my_orders_done_items_tab.dart';
import 'package:harri_farm_app/features/my_orders/widgets/my_orders_tab_bar.dart';

import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrdersCubit(),
      child: Scaffold(
        appBar: AppAppBar(
          title: "my_orders".tr(),
          leading: InkWell(
            onTap: () => RouteUtils.pop(),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 18,
            ),
          ),
          elevation: 0,
        ),
        body: BlocBuilder<MyOrdersCubit, MyOrdersStates>(
          builder: (context, state) {
            final cubit = MyOrdersCubit.of(context);

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: [
                  SizedBox(height: 44.height),
                  const MyOrdersTabBar(),
                  SizedBox(height: 24.height),
                  [
                    const MyOrdersCurrentItemsTab(),
                    const MyOrdersDoneItemsTab(),
                  ][cubit.currentViewIndex],
                  SizedBox(height: Utils.bottomDevicePadding),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
