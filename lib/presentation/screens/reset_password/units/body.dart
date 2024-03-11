part of "../view.dart";

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          title: "reset_password_note".tr(),
          color: AppColors.gray,
          fontSize: 16,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 40.height),
        AppTextField(
          label: 'new_password'.tr(),
          secure: true,
          trailing: const Icon(
            Icons.remove_red_eye_outlined,
            color: AppColors.lightGray,
          ),
        ),
        SizedBox(height: 10.height),
        AppTextField(
          label: 'confirm_new_password'.tr(),
          secure: true,
          trailing: const Icon(
            Icons.remove_red_eye_outlined,
            color: AppColors.lightGray,
          ),
        ),
        SizedBox(height: 40.height),
        AppButton(
          title: "confirm".tr(),
          onTap: () {},
        ),
      ],
    );
  }
}
