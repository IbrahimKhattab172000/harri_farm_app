import 'package:easy_localization/easy_localization.dart' as loc;
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/rate_service/widgets/rate_service_button.dart';
import 'package:harri_farm_app/features/rate_service/widgets/rate_service_field.dart';
import 'package:harri_farm_app/features/rate_service/widgets/rate_service_rating_items.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';

class RateServiceView extends StatelessWidget {
  final String orderId;
  const RateServiceView({
    super.key,
    required this.orderId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "rate_service".tr(),
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
              const RateServiceRatingItems(),
              SizedBox(height: 40.height),
              const RateServiceField(),
              SizedBox(height: 40.height),
              RateServiceButton(orderId: orderId),
              SizedBox(height: Utils.bottomDevicePadding),
            ],
          ),
        ),
      ),
    );
  }
}
