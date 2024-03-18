// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class AppToggleCard extends StatelessWidget {
  final String title;
  final bool isSelected;
  final String? price;
  const AppToggleCard({
    Key? key,
    required this.title,
    required this.isSelected,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            width: 24.width,
            height: 24.height,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.background,
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.lightGray,
                width: isSelected ? 5 : 1,
              ),
            ),
          ),
          SizedBox(width: 10.width),
          AppText(
            title: title,
            color: isSelected ? AppColors.primary : AppColors.lightGray,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          const Spacer(),
          price != null
              ? AppText(
                  title: price ?? "",
                  color: AppColors.lightGray,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
