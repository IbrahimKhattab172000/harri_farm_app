import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/product_details/view/view.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_product_card.dart';

class HomeOffersCards extends StatelessWidget {
  const HomeOffersCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 300),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return AppProductCard(
            onTap: () => RouteUtils.navigateTo(const ProductDetailsView()),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 44.width);
        },
      ),
    );
  }
}
