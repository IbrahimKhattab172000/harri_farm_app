import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/login/view/view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_button.dart';

class OndoardingNextButton extends StatelessWidget {
  const OndoardingNextButton({
    super.key,
    required this.isLast,
    required this.boardController,
  });

  final bool isLast;
  final PageController boardController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppButton(
        title: "next".tr(),
        color: AppColors.primary,
        onTap: () {
          if (isLast) {
            RouteUtils.navigateTo(const LoginView());
          } else {
            boardController.nextPage(
              duration: const Duration(
                milliseconds: 750,
              ),
              curve: Curves.fastOutSlowIn,
            );
          }
        },
      ),
    );
  }
}
