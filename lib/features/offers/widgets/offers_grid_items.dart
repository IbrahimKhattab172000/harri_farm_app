import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_product_card.dart';

class OffersGridItems extends StatelessWidget {
  const OffersGridItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.width,
            crossAxisSpacing: 8.height,
            childAspectRatio: 2 / 3,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const AppProductCard();
          },
        ),
      ),
    );
  }
}
