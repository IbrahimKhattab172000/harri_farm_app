import 'package:flutter/material.dart';
import 'package:harri_farm_app/business_logic/helpers/dimentions.dart';
import 'package:harri_farm_app/business_logic/helpers/utils.dart';

class AppCustomImage extends StatelessWidget {
  const AppCustomImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Utils.getAssetPNGPath('splash'),
      width: 132.width,
      height: 132.height,
    );
  }
}