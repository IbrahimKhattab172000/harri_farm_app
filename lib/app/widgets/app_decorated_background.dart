import 'package:flutter/material.dart';
import 'package:harri_farm_app/business_logic/helpers/colors.dart';

class AppDecoratedBackGround extends StatelessWidget {
  final Widget child;
  const AppDecoratedBackGround({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        // image: DecorationImage(
        //   image: AssetImage(
        //     Utils.getAssetPNGPath('background'),
        //   ),
        //   fit: BoxFit.cover,
        // ),
        color: AppColors.background,
      ),
      child: child,
    );
  }
}
