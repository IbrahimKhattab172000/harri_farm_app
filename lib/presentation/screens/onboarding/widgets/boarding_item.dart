part of '../view.dart';

class BoardingItem extends StatelessWidget {
  final BoardingModel model;
  const BoardingItem({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
  }
}
