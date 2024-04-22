// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:harri_farm_app/features/contact_us/models/contact_us_model.dart';
import 'package:harri_farm_app/features/contact_us/widgets/contact_us_additional_contacts_widget.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ContactUsAdditionalContacts extends StatelessWidget {
  final ContactUsModel contactUsModel;
  const ContactUsAdditionalContacts({
    Key? key,
    required this.contactUsModel,
  }) : super(key: key);

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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ContactUsAdditionalContactsWidget(
              imagePath: "location",
              title: contactUsModel.data?[0].address ?? "dummy",
            ),
            ContactUsAdditionalContactsWidget(
              imagePath: "email",
              title: contactUsModel.data?[0].email ?? "dummy",
            ),
            ContactUsAdditionalContactsWidget(
              imagePath: "phone",
              title: contactUsModel.data?[0].phone ?? "dummy",
            ),
          ],
        ),
      ],
    );
  }
}
