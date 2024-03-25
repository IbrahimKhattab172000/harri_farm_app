import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class AboutUsBrief extends StatelessWidget {
  const AboutUsBrief({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: "dummy_text".tr(),
      fontSize: 14,
      color: Colors.black,
      maxLines: 4,
      overflow: TextOverflow.ellipsis,
    );
  }
}
