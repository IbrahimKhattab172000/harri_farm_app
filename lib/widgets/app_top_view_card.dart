import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class AppTopViewedCard extends StatelessWidget {
  const AppTopViewedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        Utils.getAssetPNGPath("top_viewed_meat"),
        fit: BoxFit.cover,
      ),
    );
  }
}
