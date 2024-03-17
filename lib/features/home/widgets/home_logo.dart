import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class HomeLogo extends StatelessWidget {
  const HomeLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Utils.getAssetPNGPath("logo"),
        height: 92.height,
        width: 92.width,
      ),
    );
  }
}
