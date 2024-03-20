import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class DoneImage extends StatelessWidget {
  const DoneImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Utils.getAssetPNGPath("done"),
      height: 100.height,
      width: 100.width,
    );
  }
}
