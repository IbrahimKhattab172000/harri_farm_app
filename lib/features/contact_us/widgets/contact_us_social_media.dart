import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/contact_us/models/contact_us_model.dart';
import 'package:harri_farm_app/features/contact_us/widgets/contact_us_launcher.dart';
import 'package:harri_farm_app/features/contact_us/widgets/contact_us_social_media_image.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';

class ContactUsSocialMedia extends StatelessWidget {
  final ContactUsModel contactUsModel;
  const ContactUsSocialMedia({
    Key? key,
    required this.contactUsModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            ContactUsLauncher.openUrl(path: contactUsModel.data![0].facebook!);
          },
          child: const ContactUsSocialMediaImage(imagePath: "facebook"),
        ),
        SizedBox(width: 12.width),
        GestureDetector(
          onTap: () {
            ContactUsLauncher.openUrl(path: contactUsModel.data![0].twitter!);
          },
          child: const ContactUsSocialMediaImage(imagePath: "twitter"),
        ),
        SizedBox(width: 12.width),
        GestureDetector(
          onTap: () {
            ContactUsLauncher.openUrl(
                path: contactUsModel.data![0].websiteUrl!);
          },
          child: const ContactUsSocialMediaImage(imagePath: "globe"),
        ),
        SizedBox(width: 12.width),
        GestureDetector(
          onTap: () {
            ContactUsLauncher.openUrl(path: contactUsModel.data![0].snapchat!);
          },
          child: const ContactUsSocialMediaImage(imagePath: "snapchat"),
        ),
        SizedBox(width: 12.width),
        GestureDetector(
          onTap: () {
            ContactUsLauncher.openUrl(path: contactUsModel.data![0].instagram!);
          },
          child: const ContactUsSocialMediaImage(imagePath: "instagram"),
        ),
      ],
    );
  }
}
