import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/my_orders_details/widgets/my_orders_details_card.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';

class MyOrdersDetailsItems extends StatelessWidget {
  const MyOrdersDetailsItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: 2,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 8.height),
      itemBuilder: (context, index) {
        return const MyOrdersDetailsCard();
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
