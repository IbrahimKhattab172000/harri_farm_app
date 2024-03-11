part of "../view.dart";

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          title: "new_signing".tr(),
          color: AppColors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(height: 30.height),
        AppTextField(label: "name".tr()),
        SizedBox(height: 10.height),
        AppTextField(label: "phone".tr()),
        SizedBox(height: 10.height),
        AppTextField(label: "email".tr()),
        SizedBox(height: 10.height),
        AppTextField(
          label: 'password'.tr(),
          secure: true,
          trailing: const Icon(
            Icons.remove_red_eye_outlined,
            color: AppColors.lightGray,
          ),
        ),
        SizedBox(height: 10.height),
        AppTextField(
          label: 'confirm_password'.tr(),
          secure: true,
          trailing: const Icon(
            Icons.remove_red_eye_outlined,
            color: AppColors.lightGray,
          ),
        ),
        SizedBox(height: 26.height),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 16.width,
                height: 16.height,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.transparent,
                  border: Border.all(
                    color: AppColors.lightGray,
                    width: 1.width,
                  ),
                ),
              ),
            ),
            SizedBox(width: 14.width),
            AppText(
              title: "i_agree".tr(),
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(width: 4.width),
            AppText(
              title: "terms_and_conditions".tr(),
              color: AppColors.primary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        SizedBox(height: 44.height),
        AppButton(
          title: "signup".tr(),
          onTap: () {},
        ),
        SizedBox(height: 8.height),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              title: 'have_account'.tr(),
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(width: 5.width),
            GestureDetector(
              onTap: () {
                RouteUtils.navigateTo(const SignUpView());
              },
              child: AppText(
                title: 'login'.tr(),
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        SizedBox(height: 14.height),
        AppText(
          title: 'browse_without_logging_in'.tr(),
          color: AppColors.primary,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }
}