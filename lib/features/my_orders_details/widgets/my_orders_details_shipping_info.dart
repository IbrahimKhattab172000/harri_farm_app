import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/my_orders_details/models/my_orders_details_model.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class MyOrdersDetailsShippingInfo extends StatelessWidget {
  final MyOrderDetailsModel myOrderDetailsModel;

  const MyOrdersDetailsShippingInfo({
    super.key,
    required this.myOrderDetailsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppText(
              title: "shipping_details".tr(),
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        SizedBox(height: 20.height),
        Container(
          // height: 142.height,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.primary,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: myOrderDetailsModel.data?.name ?? "",
                  fontSize: 14,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 4.height),
                AppText(
                  title: myOrderDetailsModel.data?.phone.toString() ?? "",
                  fontSize: 14,
                  color: AppColors.lightGray,
                ),
                SizedBox(height: 4.height),
                AppText(
                  title: myOrderDetailsModel.data?.address ?? "",
                  fontSize: 14,
                  color: AppColors.lightGray,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
