import 'package:flutter/material.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class AboutUsBrief extends StatelessWidget {
  final String aboutUsBrief;
  const AboutUsBrief({
    super.key,
    required this.aboutUsBrief,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: aboutUsBrief,
      fontSize: 14,
      color: Colors.black,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}
