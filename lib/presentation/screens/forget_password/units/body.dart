part of "../view.dart";

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          title: "forgot_password_note".tr(),
          color: AppColors.lightBlack,
          fontSize: 16,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 40.height),
        AppTextField(label: "email_or_phone".tr()),
        SizedBox(height: 40.height),
        AppButton(
          title: "send_code".tr(),
          onTap: () {
            RouteUtils.navigateTo(const VerificationView());
          },
        ),
      ],
    );
  }
}
