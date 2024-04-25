// ignore_for_file: sort_child_properties_last

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/login/view/login_view.dart';
import 'package:harri_farm_app/widgets/app_button.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/helpers/routes.dart';

class AppDialog extends StatelessWidget {
  final Widget child;
  final bool dismissible;
  final String title;
  final bool hasButton;
  final String buttonTitle;
  final VoidCallback buttonOnTap;

  const AppDialog({
    super.key,
    required this.child,
    required this.dismissible,
    required this.title,
    required this.hasButton,
    required this.buttonTitle,
    required this.buttonOnTap,
  });

  static Future<dynamic> show({
    required Widget child,
    String? title,
    bool dismissible = true,
    bool hasButton = true,
    String? buttonTitle,
    VoidCallback? buttonOnTap,
  }) {
    return showDialog(
      context: RouteUtils.context,
      barrierDismissible: false,
      // barrierColor: AppColors.secondary.withOpacity(0.7),
      builder: (context) {
        return AppDialog(
          child: child,
          dismissible: dismissible,
          title: title ?? "no_data".tr(),
          hasButton: hasButton,
          buttonTitle: buttonTitle ?? "login".tr(),
          buttonOnTap: buttonOnTap ??
              () {
                RouteUtils.navigateAndPopAll(const LoginView());
              },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Material(
      color: Colors.transparent,
      child: UnconstrainedBox(
        constrainedAxis: Axis.horizontal,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: AppColors.white,
            border: Border.all(width: 4, color: AppColors.white),
          ),
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: keyboardHeight,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 60.height,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: AppText(
                      textAlign: TextAlign.center,
                      title: title,
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (dismissible)
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: Utils.isAR ? null : 12,
                      right: Utils.isAR ? 12 : null,
                      child: UnconstrainedBox(
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 32.width,
                            width: 32.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.primary,
                            ),
                            child: const Icon(
                              Icons.close,
                              color: AppColors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Column(
                children: [
                  child,
                  if (hasButton)
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: AppButton(
                        title: buttonTitle,
                        onTap: buttonOnTap,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
