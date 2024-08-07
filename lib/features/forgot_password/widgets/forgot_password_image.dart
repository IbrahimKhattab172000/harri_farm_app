import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class ForgotPasswordImage extends StatelessWidget {
  const ForgotPasswordImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.height,
      width: 300.width,
      child: Center(
        child: Image.asset(
          Utils.getAssetPNGPath("forget_password"),
        ),
      ),
    );
  }
}
