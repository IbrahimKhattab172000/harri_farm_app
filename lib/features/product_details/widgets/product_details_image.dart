import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        Utils.getAssetPNGPath("product_details_image"),
        fit: BoxFit.cover,
      ),
    );
  }
}
