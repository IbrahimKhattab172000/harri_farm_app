part of '../view.dart';

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return AppText(
      title: 'forgot_password'.tr(),
      color: AppColors.black,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    );
  }
}
