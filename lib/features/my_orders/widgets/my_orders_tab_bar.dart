import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/my_orders/bloc/my_orders_bloc.dart';
import 'package:harri_farm_app/features/my_orders/widgets/my_orders_custom_tab.dart';

class MyOrdersTabBar extends StatelessWidget {
  const MyOrdersTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersBloc, AppState>(
      builder: (context, state) {
        final bloc = MyOrdersBloc.of(context);
        return Row(
          children: [
            MyOrdersCustomTab(
              isEnabled: bloc.currentViewIndex == 0,
              title: "current".tr(),
              onTap: () => bloc.add(ChangeView(value: 0)),
            ),
            MyOrdersCustomTab(
              isEnabled: bloc.currentViewIndex == 1,
              title: 'done'.tr(),
              onTap: () => bloc.add(ChangeView(value: 1)),
            ),
          ],
        );
      },
    );
  }
}
