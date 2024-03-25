import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_expand_down_item.dart';

class FaqView extends StatelessWidget {
  const FaqView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "faq".tr(),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 30.height),
              ExpandDownItem(
                question: "when_is_the_exchange_and_return_available".tr(),
                answer: "dummy_text".tr(),
              ),
              SizedBox(height: 14.height),
              ExpandDownItem(
                question: "what_is_harri_store_all_about".tr(),
                answer: "dummy_text".tr(),
              ),
              SizedBox(height: 14.height),
              ExpandDownItem(
                question: "what_is_harri_store_all_about".tr(),
                answer: "dummy_text".tr(),
              ),
              SizedBox(height: Utils.bottomDevicePadding),
            ],
          ),
        ),
      ),
    );
  }
}
