// ignore_for_file: library_private_types_in_public_api

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/widgets/app_toggle.dart';

class ProductDetailsOrderType extends StatefulWidget {
  const ProductDetailsOrderType({Key? key}) : super(key: key);

  @override
  _ProductDetailsOrderTypeState createState() =>
      _ProductDetailsOrderTypeState();
}

class _ProductDetailsOrderTypeState extends State<ProductDetailsOrderType> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: "order_type".tr(),
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
            title: "ذبيحه غير مطبوخه",
            isSelected: selectedIndex == 0,
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          child: AppToggleCard(
            title: "لا  شئ",
            isSelected: selectedIndex == 1,
          ),
        ),
      ],
    );
  }
}
