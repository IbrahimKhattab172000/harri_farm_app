import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/my_orders_details/models/my_orders_details_model.dart';
import 'package:harri_farm_app/features/my_orders_details/widgets/my_orders_details_card.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';

class MyOrdersDetailsItems extends StatelessWidget {
  final MyOrderDetailsModel myOrderDetailsModel;
  const MyOrdersDetailsItems({Key? key, required this.myOrderDetailsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: myOrderDetailsModel.data?.offers?.length ?? 0,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 8.height),
      itemBuilder: (context, index) {
        return MyOrdersDetailsCard(
          offer: myOrderDetailsModel.data?.offers?[index] ?? Offers(),
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
