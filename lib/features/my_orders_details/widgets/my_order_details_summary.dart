import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/cart/widgets/cart_dotted_line.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class MyOrderDetailsPriceSummary extends StatelessWidget {
  const MyOrderDetailsPriceSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: "order_summary".tr(),
          color: AppColors.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 16.height),
        MyOrderDetailsSummaryBar(
          title: "secondary_sum".tr(),
          amount: "150.00",
        ),
        SizedBox(height: 8.height),
        MyOrderDetailsSummaryBar(
          title: "discount".tr(),
          amount: "50.00",
          color: AppColors.primary,
        ),
        SizedBox(height: 8.height),
        MyOrderDetailsSummaryBar(
          title: "service_fees".tr(),
          amount: "40.00",
        ),
        SizedBox(height: 8.height),
        MyOrderDetailsSummaryBar(
          title: "extra_tax_value".tr(),
          amount: "10.00",
        ),
        SizedBox(height: 14.height),
        const CartDottedLine(),
        SizedBox(height: 14.height),
        MyOrderDetailsSummaryBar(
          title: "total_sum".tr(),
          amount: "450.00",
        ),
      ],
    );
  }
}

class MyOrderDetailsSummaryBar extends StatelessWidget {
  final String title;
  final String amount;
  final Color? color;
  const MyOrderDetailsSummaryBar({
    Key? key,
    required this.title,
    required this.amount,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          title: title,
          color: color ?? AppColors.black,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        const Spacer(),
        Row(
          children: [
            AppText(
              title: 'LE',
              color: color ?? AppColors.black,
              maxLines: 1,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            SizedBox(width: 4.width),
            AppText(
              title: amount,
              color: color ?? AppColors.black,
              maxLines: 1,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ],
        ),
      ],
    );
  }
}
