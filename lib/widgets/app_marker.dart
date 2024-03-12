import 'package:flutter/material.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class AppMapMarker extends StatelessWidget {
  final String title;
  final String image;
  const AppMapMarker({
    Key? key,
    this.onTap,
    required this.title,
    required this.image,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            Utils.getAssetPNGPath(image),
            height: 52.height,
            width: 50.width,
          ),
          AppText(
            title: title,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
