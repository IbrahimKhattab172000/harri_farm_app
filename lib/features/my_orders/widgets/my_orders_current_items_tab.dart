import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/my_orders/widgets/my_orders_card.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';

class MyOrdersCurrentItemsTab extends StatelessWidget {
  const MyOrdersCurrentItemsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 8.height),
      itemBuilder: (context, index) {
        return MyOrdersCard(
          onCountChanged: (int count) {},
          orderType: "in_delivery",
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 1,
          color: AppColors.lightGray,
        );
      },
    );
  }
}
