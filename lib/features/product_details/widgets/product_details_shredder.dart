import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_toggle.dart';

class ProductDetailsShredder extends StatelessWidget {
  const ProductDetailsShredder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: "shredder_type".tr(),
          fontSize: 16,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 16.height),
        const AppToggleCard(
          title: "طريقة تقطيع",
          isSelected: true,
          price: "(+\$ 15)",
        ),
        const AppToggleCard(
          title: "طريقة تقطيع",
          price: "(+\$ 10)",
          isSelected: false,
        ),
        const AppToggleCard(
          title: "طريقة تقطيع",
          isSelected: false,
          price: "(+\$ 15)",
        ),
      ],
    );
  }
}
