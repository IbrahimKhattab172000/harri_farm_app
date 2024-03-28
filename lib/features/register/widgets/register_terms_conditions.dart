import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class RegisterTermAndConditions extends StatelessWidget {
  const RegisterTermAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 16.width,
            height: 16.height,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.transparent,
              border: Border.all(
                color: AppColors.lightGray,
                width: 1.width,
              ),
            ),
          ),
        ),
        SizedBox(width: 14.width),
        AppText(
          title: "i_agree".tr(),
          color: AppColors.black,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(width: 4.width),
        AppText(
          title: "terms_and_conditions".tr(),
          color: AppColors.primary,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}
