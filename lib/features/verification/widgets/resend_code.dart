import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class ResendWidget extends StatefulWidget {
  const ResendWidget({super.key});

  @override
  State<ResendWidget> createState() => _ResendWidgetState();
}

class _ResendWidgetState extends State<ResendWidget> {
  int counter = 60;
  Timer? timer;

  @override
  void initState() {
    count();
    super.initState();
  }

  void count() {
    counter = 60;
    setState(() {});
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      counter--;
      setState(() {});
      if (counter == 0) {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (counter != 0) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "00:${counter.toString().padLeft(2, '0')}",
              style: const TextStyle(
                color: AppColors.gray,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }
    return GestureDetector(
      onTap: count,
      child: AppText(
        title: "resend_code".tr(),
        decoration: TextDecoration.underline,
        color: AppColors.gray,
        fontSize: 16,
      ),
    );
  }
}
