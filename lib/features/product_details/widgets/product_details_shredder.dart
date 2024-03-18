import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_toggle.dart';

class ProductDetailsShredder extends StatefulWidget {
  const ProductDetailsShredder({
    super.key,
  });

  @override
  State<ProductDetailsShredder> createState() => _ProductDetailsShredderState();
}

class _ProductDetailsShredderState extends State<ProductDetailsShredder> {
  int selectedIndex = 0;

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
        GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          child: AppToggleCard(
            title: "طريقة تقطيع",
            isSelected: selectedIndex == 0,
            price: "(+\$ 15)",
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          child: AppToggleCard(
            title: "طريقة تقطيع",
            price: "(+\$ 10)",
            isSelected: selectedIndex == 1,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = 2;
            });
          },
          child: AppToggleCard(
            title: "طريقة تقطيع",
            isSelected: selectedIndex == 2,
            price: "(+\$ 15)",
          ),
        ),
      ],
    );
  }
}
