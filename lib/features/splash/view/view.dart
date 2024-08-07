import 'package:flutter/material.dart';
import 'package:harri_farm_app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/features/onboarding/view/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      RouteUtils.navigateAndPopAll(
        const OnBoardingView(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppDecoratedBackGround(
        child: Center(
          child: Image.asset(
            Utils.getAssetPNGPath('logo'),
            width: 240.width,
            height: 240.height,
          ),
        ),
      ),
    );
  }
}
