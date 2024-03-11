import 'package:flutter/material.dart';
import 'package:harri_farm_app/app/widgets/app_decorated_background.dart';
import 'package:harri_farm_app/business_logic/helpers/dimentions.dart';
import 'package:harri_farm_app/business_logic/helpers/utils.dart';
import 'package:harri_farm_app/business_logic/routing/routes.dart';
import 'package:harri_farm_app/presentation/screens/onboarding/view.dart';

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
        OnBoardingView(),
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
            Utils.getAssetPNGPath('splash'),
            width: 240.width,
            height: 240.height,
          ),
        ),
      ),
    );
  }
}
