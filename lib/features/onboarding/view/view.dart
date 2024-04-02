import 'package:flutter/material.dart';
import 'package:harri_farm_app/core/app_storage.dart';
import 'package:harri_farm_app/features/onboarding/models/boarding.dart';
import 'package:harri_farm_app/features/onboarding/widgets/onboarding_indicators.dart';
import 'package:harri_farm_app/features/onboarding/widgets/onboarding_item.dart';
import 'package:harri_farm_app/features/onboarding/widgets/onboarding_next_button.dart';
import 'package:harri_farm_app/features/onboarding/widgets/onboarding_skip_button.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var boardController = PageController();

  bool isLast = false;
  @override
  void initState() {
    AppStorage.cacheOnBoarding(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppDecoratedBackGround(
        child: Column(
          children: [
            const OnboardingSkipButton(),
            SizedBox(height: 50.height),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: ((context, index) => OnboardingItem(
                      model: boarding[index],
                    )),
                itemCount: boarding.length,
                onPageChanged: (index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 16.height),
            OnboardingIndicators(boardController: boardController),
            SizedBox(height: 48.height),
            OndoardingNextButton(
                isLast: isLast, boardController: boardController),
            SizedBox(height: Utils.bottomDevicePadding),
          ],
        ),
      ),
    );
  }
}
