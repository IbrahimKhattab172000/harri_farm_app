import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class AppDrawerTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;
  const AppDrawerTile({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            Utils.getAssetPNGPath(imagePath),
            height: 28.height,
            width: 28.width,
          ),
          SizedBox(width: 16.width),
          AppText(
            title: title.tr(),
            fontSize: 14,
            color: AppColors.black,
            fontWeight: FontWeight.w700,
          ),
          const Spacer(),
          isLogout
              ? const SizedBox()
              : const Icon(Icons.arrow_forward_ios, size: 20),
        ],
      ),
    );
  }
}
