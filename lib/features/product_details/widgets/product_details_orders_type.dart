import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_toggle.dart';

class ProductDetailsOrderType extends StatefulWidget {
  const ProductDetailsOrderType({Key? key}) : super(key: key);

  @override
  State<ProductDetailsOrderType> createState() =>
      _ProductDetailsOrderTypeState();
}

class _ProductDetailsOrderTypeState extends State<ProductDetailsOrderType> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: "order_type".tr(),
            fontSize: 16,
            color: AppColors.black,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(height: 16.height),
          AppToggleCard(
            title: "uncooked".tr(),
            isSelected: selectedIndex == 0,
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            },
          ),
          AppToggleCard(
            title: "nothing".tr(),
            isSelected: selectedIndex == 1,
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            },
          ),
        ],
      ),
    );
  }
}
