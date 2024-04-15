import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/my_orders_details/models/my_orders_details_model.dart';
import 'package:harri_farm_app/features/rate_service/view/view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class MyOrderDetailsRateBar extends StatelessWidget {
  final MyOrderDetailsModel myOrderDetailsModel;
  const MyOrderDetailsRateBar({
    super.key,
    required this.myOrderDetailsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          title:
              "${"order_number".tr()} # ${myOrderDetailsModel.data?.id.toString()}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          color: AppColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            RouteUtils.navigateTo(RateServiceView(
              orderId: myOrderDetailsModel.data?.id.toString() ?? "",
            ));
          },
          child: AppText(
            title: "rate_service".tr(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            color: AppColors.primary,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
