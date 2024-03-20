import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';

class AppToggleButton extends StatelessWidget {
  const AppToggleButton({
    super.key,
    required this.value,
    this.onChanged,
    this.rotate = true,
    this.color = AppColors.primary,
  });

  final bool value;
  final void Function(bool)? onChanged;
  final bool rotate;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22.height,
      height: 22.height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: value ? AppColors.primary : AppColors.black,
          width: 2,
        ),
        color: AppColors.white,
      ),
      padding: const EdgeInsets.all(1),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: value ? AppColors.primary : AppColors.white,
        ),
      ),
    );
  }
}
