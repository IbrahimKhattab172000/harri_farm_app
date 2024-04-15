import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/rate_service/bloc/rate_service_bloc.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_rating_widget.dart';

class RateServiceRatingItems extends StatelessWidget {
  const RateServiceRatingItems({super.key});

  @override
  Widget build(BuildContext context) {
    //!Here
    final bloc = RateServiceBloc.of(context);
    return Column(
      children: [
        AppRatingWidget(
          title: "the_order",
          rate: 0,
          onRate: (orderRate) {
            bloc.fillBody(order: orderRate.toString());
            log("orderRate $orderRate");
          },
          hItemPadding: 8,
        ),
        SizedBox(height: 12.height),
        AppRatingWidget(
          title: "the_service",
          rate: 0,
          onRate: (serviceRate) {
            bloc.fillBody(service: serviceRate.toString());
            log("serviceRate $serviceRate");
          },
          hItemPadding: 8,
        ),
        SizedBox(height: 12.height),
        AppRatingWidget(
          title: "delivery_speed",
          rate: 0,
          onRate: (deliveryRate) {
            bloc.fillBody(deliverySpeed: deliveryRate.toString());
            log("deliveryRate $deliveryRate");
          },
          hItemPadding: 8,
        ),
        SizedBox(height: 12.height),
        AppRatingWidget(
          title: "your_satisfaction_level",
          rate: 0,
          onRate: (satisfactionRate) {
            bloc.fillBody(satisfaction: satisfactionRate.toString());
            log("satisfactionRate $satisfactionRate");
          },
          hItemPadding: 8,
        ),
      ],
    );
  }
}
