import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/core/app_storage.dart';
import 'package:harri_farm_app/features/forgot_password/repository/forget_password_repository.dart';
import 'package:harri_farm_app/features/verification/view/verification_view.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class ForgetPasswordBloc extends Bloc<AppEvent, AppState> {
  ForgetPasswordBloc() : super(Start()) {
    on<Click>(_sendCode);
  }
  static ForgetPasswordBloc of(context) => BlocProvider.of(context);

  TextEditingController emailOrPhone = TextEditingController();
  var formKey = GlobalKey<FormState>();

  _sendCode(AppEvent event, Emitter<AppState> emit) async {
    if (!formKey.currentState!.validate()) return;
    emit(Loading());

    String body = emailOrPhone.text;
    try {
      Response response = await ForgetPasswordRepository.sendCode(body: body);
      log("statussss ${response.statusCode}");

      if (response.statusCode == 200) {
        log("Done ${response.statusCode}");
        AppStorage.cacheId(response.data['user_id']);
        emit(Done());
        RouteUtils.navigateTo(const VerificationView());
      } else {
        log("Error ${response.statusCode}");
        showSnackBar(response.data['message'], errorMessage: true);

        emit(Error());
      }
    } catch (e) {
      log("error from the catch part: $e");
      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
