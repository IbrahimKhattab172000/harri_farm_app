import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class ContactUsSocialMediaImage extends StatelessWidget {
  final String imagePath;
  const ContactUsSocialMediaImage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Utils.getAssetPNGPath(imagePath),
      height: 20.height,
      width: 20.width,
    );
  }
}
