import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/contact_us/widgets/contact_us_additional_contacts_widget.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ContactUsAdditionalContacts extends StatelessWidget {
  const ContactUsAdditionalContacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          title: "contact_us_also".tr(),
          textAlign: TextAlign.center,
          color: AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 24.height),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContactUsAdditionalContactsWidget(
              imagePath: "location",
              title: "الرياض , حي التعاون",
            ),
            ContactUsAdditionalContactsWidget(
              imagePath: "email",
              title: "Info@gmail.com",
            ),
            ContactUsAdditionalContactsWidget(
              imagePath: "phone",
              title: "966 123 456 789",
            ),
          ],
        ),
      ],
    );
  }
}
