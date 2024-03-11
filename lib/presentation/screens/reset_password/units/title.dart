part of '../view.dart';

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: "resetting_the_password".tr(),
      color: AppColors.black,
      fontWeight: FontWeight.w700,
      fontSize: 20,
    );
  }
}
