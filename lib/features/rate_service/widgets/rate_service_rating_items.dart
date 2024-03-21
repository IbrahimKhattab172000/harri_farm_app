import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_rating_widget.dart';

class RateServiceRatingItems extends StatelessWidget {
  const RateServiceRatingItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppRatingWidget(
          title: "the_order",
          rate: 3,
          onRate: (p0) {},
          hItemPadding: 8,
        ),
        SizedBox(height: 12.height),
        AppRatingWidget(
          title: "the_service",
          rate: 3,
          onRate: (p0) {},
          hItemPadding: 8,
        ),
        SizedBox(height: 12.height),
        AppRatingWidget(
          title: "delivery_speed",
          rate: 3,
          onRate: (p0) {},
          hItemPadding: 8,
        ),
        SizedBox(height: 12.height),
        AppRatingWidget(
          title: "your_satisfaction_level",
          rate: 3,
          onRate: (p0) {},
          hItemPadding: 8,
        ),
      ],
    );
  }
}
