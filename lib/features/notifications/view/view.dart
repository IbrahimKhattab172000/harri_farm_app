import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:harri_farm_app/features/notifications/view/empty.dart';
import 'package:harri_farm_app/features/notifications/widgets/notification_card.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';

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
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, item) {
                return const NotificationCard();
              },
              separatorBuilder: (context, item) {
                return const Divider(
                  thickness: 1,
                  color: AppColors.lightGray,
                );
              },
              itemCount: 100,
              padding: const EdgeInsets.all(16),
            ),
    );
  }
}
