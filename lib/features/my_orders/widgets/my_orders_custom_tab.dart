import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/features/my_orders/bloc/tab_cubit/cubit.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class MyOrdersCustomTab extends StatelessWidget {
  final bool isEnabled;
  final String title;
  final VoidCallback onTap;

  const MyOrdersCustomTab({
    Key? key,
    required this.isEnabled,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double lineWidth = title.length * 10;
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText(
              title: title,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
              maxLines: 1,
            ),
            SizedBox(height: 4.height),
            isEnabled == true
                ? Container(
                    width: lineWidth,
                    height: 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primary,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
