import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ProductDetailsDescribtion extends StatelessWidget {
  const ProductDetailsDescribtion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: "describtion".tr(),
          fontSize: 16,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 16.height),
        const AppText(
          title:
              "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى أيضا",
          fontSize: 16,
          color: AppColors.gray,
          fontWeight: FontWeight.w500,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
