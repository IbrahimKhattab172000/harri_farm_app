import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "terms_and_conditions".tr(),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 30.height),
              AppText(
                title: "dummy_text".tr(),
                fontSize: 16,
                color: Colors.black,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 24.height),
              AppText(
                title: "dummy_text".tr(),
                fontSize: 16,
                color: Colors.black,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 24.height),
              AppText(
                title: "dummy_text".tr(),
                fontSize: 16,
                color: Colors.black,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 24.height),
              AppText(
                title: "dummy_text".tr(),
                fontSize: 16,
                color: Colors.black,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: Utils.bottomDevicePadding),
            ],
          ),
        ),
      ),
    );
  }
}
