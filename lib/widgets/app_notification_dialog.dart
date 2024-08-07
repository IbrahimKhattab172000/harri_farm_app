import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/widgets/app_text.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';

class NotificationDialog {
  static void show({
    required BuildContext context,
    required String title,
    required String body,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: AppText(
            title: title,
            color: AppColors.primary,
            fontWeight: FontWeight.w900,
            fontSize: 20,
            textAlign: TextAlign.center,
          ),
          backgroundColor: AppColors.background,
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  Utils.getAssetPNGPath("kidnapped"),
                ),
              ),
              SizedBox(height: 20.height),
              AppText(
                title: body,
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const AppText(
                title: "I don't care",
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ],
        );
      },
    );
  }

  static showIosDialog({
    required BuildContext context,
    required String title,
    required String body,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              // await Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const NotificationView(
              //       body: {},
              //     ),
              //   ),
              // );
            },
          )
        ],
      ),
    );
  }
}
