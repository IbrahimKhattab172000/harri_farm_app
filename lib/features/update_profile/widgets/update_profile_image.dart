import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class UpdateProfileProfileImage extends StatelessWidget {
  const UpdateProfileProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.height,
      width: 64.height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primary,
      ),
      child: Center(
        child: Image.asset(
          Utils.getAssetPNGPath("profile"),
        ),
      ),
    );
  }
}
