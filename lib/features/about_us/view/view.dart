import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/about_us/widgets/about_us_brief.dart';
import 'package:harri_farm_app/features/about_us/widgets/about_us_card.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "about_us".tr(),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 30.height),
              const AboutUsBrief(),
              SizedBox(height: 24.height),
              const AboutUsCard(title: "our_view"),
              SizedBox(height: 24.height),
              const AboutUsCard(title: "our_mission"),
              SizedBox(height: 24.height),
              const AboutUsCard(title: "our_values"),
            ],
          ),
        ),
      ),
    );
  }
}
