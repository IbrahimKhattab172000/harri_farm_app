import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/product_details/models/selection.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_drop_down_menu.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ProductDetailsExtraService extends StatelessWidget {
  const ProductDetailsExtraService({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: "extra_service".tr(),
          fontSize: 16,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 16.height),
        AppDropDownSelection.single(
          initialItem: SelectionItem(
            label: "تجريد من العظم ",
            value: "0",
            price: "(+\$ 15)",
          ),
          onChangeSingle: (value) {},
          items: [
            SelectionItem(
              label: "تجريد من العظم ",
              value: "1",
              price: "(+\$ 15)",
            ),
            SelectionItem(
              label: "متقطعه",
              value: "2",
              price: "(+\$ 15)",
            ),
            SelectionItem(
              label: "مفرومه",
              value: "3",
              price: "(+\$ 15)",
            ),
            SelectionItem(
              label: "مهروسه مع جبنه",
              value: "4",
              price: "(+\$ 15)",
            ),
          ],
          hint: "اختر واحدة من الإضافات",
          height: MediaQuery.sizeOf(context).height * 0.33,
        ),
        SizedBox(height: 16.height),
      ],
    );
  }
}
