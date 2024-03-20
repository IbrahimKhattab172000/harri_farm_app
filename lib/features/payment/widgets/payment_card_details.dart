import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text_field.dart';

class PaymentCardDetails extends StatelessWidget {
  const PaymentCardDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24.height),
        AppTextField(
          label: "card_name".tr(),
          fillColor: AppColors.background,
          borderColor: AppColors.lightGray,
        ),
        SizedBox(height: 10.height),
        AppTextField(
          label: "card_holder_name".tr(),
          fillColor: AppColors.background,
          borderColor: AppColors.lightGray,
        ),
        SizedBox(height: 10.height),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                label: "expiry_date".tr(),
                fillColor: AppColors.background,
                borderColor: AppColors.lightGray,
                hint: "month_year".tr(),
              ),
            ),
            SizedBox(width: 10.width),
            Expanded(
              child: AppTextField(
                label: "security_code".tr(),
                fillColor: AppColors.background,
                borderColor: AppColors.lightGray,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
