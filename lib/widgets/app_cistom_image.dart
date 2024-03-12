import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class AppCustomImage extends StatelessWidget {
  const AppCustomImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Utils.getAssetPNGPath('logo'),
      width: 132.width,
      height: 132.height,
    );
  }
}
