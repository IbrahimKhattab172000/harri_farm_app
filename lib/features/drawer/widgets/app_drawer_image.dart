import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class AppDrawerImage extends StatelessWidget {
  const AppDrawerImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Utils.getAssetPNGPath("logo"),
        height: 72.height,
        width: 72.width,
      ),
    );
  }
}
