// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/notifications/bloc/notifications_bloc.dart';
import 'package:harri_farm_app/features/notifications/view/empty.dart';
import 'package:harri_farm_app/features/notifications/widgets/notification_card.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/widgets/app_appbar.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        title: "notifications".tr(),
        elevation: 0,
      ),
      body: BlocBuilder<NotificationBloc, AppState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Error) {
            return Center(child: AppText(title: 'error_loading_data'.tr()));
          } else if (state is Empty) {
            return const NotificationsEmpty();
          } else {
            NotificationBloc bloc = NotificationBloc.of(context);
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return NotificationCard(
                  title: bloc.notificationData.data![index].title!,
                  dateTime: bloc.notificationData.data![index].createdAt!,
                );
              },
              separatorBuilder: (context, item) {
                return const Divider(
                  thickness: 1,
                  color: AppColors.lightGray,
                );
              },
              itemCount: bloc.notificationData.data!.length,
              padding: const EdgeInsets.all(16),
            );
          }
        },
      ),
    );
  }
}
// Abo Ead EL Dawle , Ana za3lan mnk ya sahbe 34an magbtlesh
// elrob3 bta3ae 