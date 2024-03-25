import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/rate_service/view/view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class MyOrderDetailsRateBar extends StatelessWidget {
  const MyOrderDetailsRateBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          title: "${"order_number".tr()}  #28102022",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          color: AppColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            RouteUtils.navigateTo(const RateServiceView());
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
