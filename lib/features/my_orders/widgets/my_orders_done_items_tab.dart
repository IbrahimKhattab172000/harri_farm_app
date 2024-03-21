import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/my_orders/widgets/my_orders_card.dart';
import 'package:harri_farm_app/features/my_orders_details/view/view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';

class MyOrdersDoneItemsTab extends StatelessWidget {
  final List<String> orderType = [
    "rejected",
    "delivered",
    "delivered",
  ];

  MyOrdersDoneItemsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: orderType.length,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 16.height),
        itemBuilder: (context, index) {
          return MyOrdersCard(
            orderType: orderType[index],
            onTap: () {
              RouteUtils.navigateTo(
                  MyOrdersDetailsView(orderType: orderType[index]));
            },
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 1,
            color: AppColors.lightGray,
          );
        },
      ),
    );
  }
}
