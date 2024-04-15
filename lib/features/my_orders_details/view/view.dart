import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/my_orders_details/widgets/my_orders_details_header.dart';
import 'package:harri_farm_app/features/my_orders_details/widgets/my_orders_details_rate_bar.dart';
import 'package:harri_farm_app/features/my_orders_details/widgets/my_orders_details_items.dart';
import 'package:harri_farm_app/features/my_orders_details/widgets/my_orders_details_rejection.dart';
import 'package:harri_farm_app/features/my_orders_details/widgets/my_orders_details_shipping_info.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_button.dart';
import 'package:harri_farm_app/widgets/app_price_summary.dart';

class MyOrdersDetailsView extends StatelessWidget {
  final String status;

  const MyOrdersDetailsView({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "order_details".tr(),
        leading: InkWell(
          onTap: () => RouteUtils.pop(),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24.height),
              MyOrderDetailsHeader(status: status),
              SizedBox(height: 28.height),
              const MyOrderDetailsRateBar(),
              SizedBox(height: 28.height),
              const MyOrdersDetailsItems(),
              SizedBox(height: 20.height),
              const MyOrdersDetailsShippingInfo(),
              SizedBox(height: 16.height),
              status == "refuse" || status == "تم الرفض"
                  ? const MyOrdersDetailsRejection()
                  : const AppPriceSummary(),
              SizedBox(height: 40.height),
              AppButton(
                title: "re_order".tr(),
                onTap: () {},
              ),
              SizedBox(height: Utils.bottomDevicePadding),
            ],
          ),
        ),
      ),
    );
  }
}
