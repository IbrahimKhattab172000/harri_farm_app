import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class VerificationNote extends StatelessWidget {
  const VerificationNote({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: "forgot_password_note".tr(),
      color: const Color.fromRGBO(59, 59, 59, 1),
      fontSize: 16,
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
