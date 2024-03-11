part of '../view.dart';

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
    title: "اجود أنواع المنتجات الطازجة",
    body:
        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى ",
  ),
  BoardingModel(
    imagePath: "onboarding2",
    title: "اطلب من اى مكان نصلك اينما كنت",
    body:
        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى ",
  ),
  BoardingModel(
    imagePath: "onboarding3",
    title: "خدمة التوصيل لباب المنزل",
    body:
        "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضا",
  ),
];
