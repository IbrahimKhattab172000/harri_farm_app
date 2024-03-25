import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/contact_us/widgets/contact_us_social_media_image.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';

class ContactUsSocialMedia extends StatelessWidget {
  const ContactUsSocialMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ContactUsSocialMediaImage(imagePath: "facebook"),
        SizedBox(width: 12.width),
        const ContactUsSocialMediaImage(imagePath: "twitter"),
        SizedBox(width: 12.width),
        const ContactUsSocialMediaImage(imagePath: "globe"),
        SizedBox(width: 12.width),
        const ContactUsSocialMediaImage(imagePath: "snapchat"),
        SizedBox(width: 12.width),
        const ContactUsSocialMediaImage(imagePath: "instagram"),
      ],
    );
  }
}
