import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/my_orders/widgets/my_orders_card.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';

class MyOrdersDoneItemsTab extends StatelessWidget {
  const MyOrdersDoneItemsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 2,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 16.height),
        itemBuilder: (context, index) {
          return MyOrdersCard(
            onCountChanged: (int count) {},
            orderType: "delivered",
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
