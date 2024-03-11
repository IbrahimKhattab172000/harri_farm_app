import 'package:flutter/material.dart';
import 'package:harri_farm_app/app/widgets/app_text.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AppText(title: "اجود أنواع المنتجات الطازجة"),
          ),
        ],
      ),
    );
  }
}
