import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/notifications/view/empty.dart';
import 'package:harri_farm_app/features/notifications/widgets/notification_card.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/utils.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class NotificationsView extends StatelessWidget {
  final bool isEmpty;

  const NotificationsView({super.key, required this.isEmpty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "notifications".tr(),
        elevation: 0,
      ),
      body: isEmpty
          ? const NotificationsEmpty()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(height: 40.height),
                  ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, item) {
                      return const NotificationCard();
                    },
                    separatorBuilder: (context, item) {
                      return const Divider(
                        thickness: 1,
                        color: AppColors.lightGray,
                      );
                    },
                    itemCount: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
