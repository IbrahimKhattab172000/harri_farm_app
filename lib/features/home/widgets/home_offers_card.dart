import 'package:flutter/material.dart';
import 'package:harri_farm_app/widgets/app_product_card.dart';

class HomeOffersCards extends StatelessWidget {
  const HomeOffersCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AppProductCard(),
        AppProductCard(),
      ],
    );
  }
}
