import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/onboarding/models/boarding.dart';
import 'package:harri_farm_app/features/onboarding/widgets/boarding_item.dart';
import 'package:harri_farm_app/widgets/app_button.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/features/login/view/view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var boardController = PageController();

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppDecoratedBackGround(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  RouteUtils.navigateTo(const LoginView());
                },
                child: Padding(
                  padding: EdgeInsets.only(top: Utils.topDevicePadding + 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: AppText(
                      title: "skip".tr(),
                      color: AppColors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.height),
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: boardController,
                  itemBuilder: ((context, index) => BoardingItem(
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
              SmoothPageIndicator(
                axisDirection: Axis.horizontal,
                controller: boardController,
                count: boarding.length,
                textDirection:
                    Utils.isAR ? TextDirection.rtl : TextDirection.ltr,
                effect: const JumpingDotEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  dotColor: AppColors.lightGray,
                  activeDotColor: AppColors.primary,
                ),
              ),
              SizedBox(height: 48.height),
              AppButton(
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
              SizedBox(height: Utils.bottomDevicePadding),
            ],
          ),
        ),
      ),
    );
  }
}
