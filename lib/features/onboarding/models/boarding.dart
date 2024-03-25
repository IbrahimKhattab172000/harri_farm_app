import 'package:easy_localization/easy_localization.dart';

class BoardingModel {
  final String imagePath;
  final String title;
  final String body;
  BoardingModel({
    required this.imagePath,
    required this.title,
    required this.body,
  });
}

List<BoardingModel> boarding = [
  BoardingModel(
    imagePath: "onboarding1",
    title: "the_finest_fresh_produce".tr(),
    body: "dummy_text".tr(),
  ),
  BoardingModel(
      imagePath: "onboarding2",
      title: "order_from_anywhere_and_we_will_reach_you_wherever_you_are".tr(),
      body: "dummy_text".tr()),
  BoardingModel(
    imagePath: "onboarding3",
    title: "home_delivery_service".tr(),
    body: "dummy_text".tr(),
  )
];
