import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/notifications/models/notification_model.dart';
import 'package:harri_farm_app/features/notifications/repository/notification_repository.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_dialog.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class NotificationBloc extends Bloc<AppEvent, AppState> {
  NotificationBloc() : super(Loading()) {
    on<Get>(_getData);
  }
  static NotificationBloc of(context) => BlocProvider.of(context);

  NotificationModel notificationData = NotificationModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await NotificationsRepository.getData();

      if (response.statusCode == 200) {
        log("Done notifications${response.statusCode}");

        emit(Done());
        notificationData = NotificationModel.fromJson(response.data);
        if (notificationData.data!.isEmpty) {
          emit(Empty());
        }
      } else {
        if ("${response.data['message']}" == "Unauthenticated.") {
          emit(UnAuthorized());
          // showSnackBar(response.data['message'], errorMessage: true);
          AppDialog.show(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 40.height),
                  AppText(
                    title: "sign_up_to_access_this_data".tr(),
                    color: AppColors.gray,
                  ),
                  SizedBox(height: 40.height),
                ],
              ),
            ),
          );
        } else {
          emit(Error());

          log("Error notifications ${response.statusCode}");
          showSnackBar(response.data['message'], errorMessage: true);
        }
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part notifications: $e");

      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
