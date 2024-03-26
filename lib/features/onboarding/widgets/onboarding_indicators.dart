import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/onboarding/models/boarding.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingIndicators extends StatelessWidget {
  const OnboardingIndicators({
    super.key,
    required this.boardController,
  });

  final PageController boardController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      axisDirection: Axis.horizontal,
      controller: boardController,
      count: boarding.length,
      textDirection: Utils.isAR ? TextDirection.rtl : TextDirection.ltr,
      effect: const JumpingDotEffect(
        dotHeight: 12,
        dotWidth: 12,
        dotColor: AppColors.lightGray,
        activeDotColor: AppColors.primary,
      ),
    );
  }
}
