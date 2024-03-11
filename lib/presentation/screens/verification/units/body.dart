part of "../view.dart";

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          title: "forgot_password_note".tr(),
          color: const Color.fromRGBO(59, 59, 59, 1),
          fontSize: 16,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 40.height),
        AppPinCodeField(
          onChanged: (code) {},
        ),
        SizedBox(height: 40.height),
        AppButton(
          title: "continue".tr(),
          onTap: () {
            RouteUtils.navigateTo(const ResetPasswordView());
          },
        ),
        SizedBox(height: 40.height),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              title: "didnt_recive_the_code".tr(),
              color: AppColors.black,
              fontSize: 16,
            ),
            SizedBox(width: 4.width),
            AppText(
              title: "resending_in".tr(),
              color: AppColors.primary,
              fontSize: 16,
            ),
            SizedBox(width: 4.width),
          ],
        )
      ],
    );
  }
}
