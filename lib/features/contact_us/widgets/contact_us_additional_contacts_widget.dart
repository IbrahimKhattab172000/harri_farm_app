import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ContactUsAdditionalContactsWidget extends StatelessWidget {
  final String imagePath;
  final String title;

  const ContactUsAdditionalContactsWidget({
    Key? key,
    required this.imagePath,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Utils.getAssetPNGPath(imagePath),
          height: 20.height,
          width: 20.width,
        ),
        SizedBox(height: 4.height),
        SizedBox(
          width: 110.width,
          child: AppText(
            title: title,
            textAlign: TextAlign.center,
            color: AppColors.black,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
