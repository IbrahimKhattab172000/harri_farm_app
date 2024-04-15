// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/my_orders/bloc/my_orders_bloc.dart';
import 'package:harri_farm_app/features/my_orders/widgets/my_orders_current_items_tab.dart';
import 'package:harri_farm_app/features/my_orders/widgets/my_orders_done_items_tab.dart';
import 'package:harri_farm_app/features/my_orders/widgets/my_orders_tab_bar.dart';

import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: BlocBuilder<MyOrdersBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(child: AppText(title: 'error_loading_data'.tr()));
          } else {
            final bloc = MyOrdersBloc.of(context);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 44.height),
                  const MyOrdersTabBar(),
                  SizedBox(height: 24.height),
                  [
                    const MyOrdersCurrentItemsTab(),
                    const MyOrdersDoneItemsTab(),
                  ][bloc.currentViewIndex],
                  SizedBox(height: Utils.bottomDevicePadding),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
