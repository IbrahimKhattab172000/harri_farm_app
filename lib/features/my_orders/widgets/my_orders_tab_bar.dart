import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/features/my_orders/bloc/tab_cubit/cubit.dart';
import 'package:harri_farm_app/features/my_orders/widgets/my_orders_custom_tab.dart';

class MyOrdersTabBar extends StatelessWidget {
  const MyOrdersTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrdersCubit, MyOrdersStates>(
      builder: (context, state) {
        final cubit = MyOrdersCubit.of(context);
        return Row(
          children: [
            MyOrdersCustomTab(
              isEnabled: cubit.currentViewIndex == 0,
              title: "current".tr(),
              onTap: () => cubit.changeView(0),
            ),
            MyOrdersCustomTab(
              isEnabled: cubit.currentViewIndex == 1,
              title: 'done'.tr(),
              onTap: () => cubit.changeView(1),
            ),
          ],
        );
      },
    );
  }
}
