import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class ContactUsSendButton extends StatelessWidget {
  const ContactUsSendButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: "send".tr(),
      onTap: () {},
    );
  }
}
