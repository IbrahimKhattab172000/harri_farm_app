import 'package:easy_localization/easy_localization.dart' as localization;
import 'package:flutter/material.dart';
import 'package:harri_farm_app/app/widgets/app_button.dart';
import 'package:harri_farm_app/app/widgets/app_text.dart';
import 'package:harri_farm_app/business_logic/helpers/colors.dart';
import 'package:harri_farm_app/business_logic/helpers/dimentions.dart';
import 'package:harri_farm_app/business_logic/helpers/utils.dart';
import 'package:harri_farm_app/business_logic/routing/routes.dart';
import 'package:harri_farm_app/presentation/screens/login/view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var boardController = PageController();

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

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
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
            SizedBox(height: 50.height),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: ((context, index) => buildBoardingItem(
                      boarding[index],
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
              textDirection: TextDirection.ltr,
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
                }),
            SizedBox(height: Utils.bottomDevicePadding),
          ],
        ),
      ),
    );
  }
}

Widget buildBoardingItem(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 300.height,
          width: 300.width,
          child: Center(
            child: Image.asset(
              Utils.getAssetPNGPath(model.imagePath),
            ),
          ),
        ),
        SizedBox(height: 14.height),
        AppText(
          title: model.title,
          color: AppColors.black,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
        SizedBox(height: 10.height),
        AppText(
          title: model.body,
          color: AppColors.lightBlack,
          fontSize: 16,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );

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
