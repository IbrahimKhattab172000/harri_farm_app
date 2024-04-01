import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/home/view/home_view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class LoginCheckWithoutLogging extends StatelessWidget {
  const LoginCheckWithoutLogging({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RouteUtils.navigateTo(const HomeView());
      },
      child: AppText(
        title: 'browse_without_logging_in'.tr(),
        color: AppColors.primary,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
