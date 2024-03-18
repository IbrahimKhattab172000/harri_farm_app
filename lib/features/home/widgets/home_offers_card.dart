import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/product_details/view/view.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_product_card.dart';

class HomeOffersCards extends StatelessWidget {
  const HomeOffersCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AppProductCard(
          onTap: () => RouteUtils.navigateTo(const ProductDetailsView()),
        ),
        AppProductCard(
          onTap: () => RouteUtils.navigateTo(const ProductDetailsView()),
        ),
      ],
    );
  }
}
