import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';

class HomeDotIndicator extends StatelessWidget {
  final bool isActive;

  const HomeDotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 16.width,
      height: 6.width,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.lightGray,
        borderRadius: BorderRadius.circular(45),
      ),
    );
  }
}
