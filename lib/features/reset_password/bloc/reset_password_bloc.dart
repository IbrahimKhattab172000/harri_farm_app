import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/reset_password/repository/reset_password_repository.dart';
import 'package:harri_farm_app/features/verification/bloc/verification_bloc.dart';
import 'package:harri_farm_app/helpers/routes.dart';

class ResetPasswordBloc extends Bloc<AppEvent, AppState> {
  ResetPasswordBloc() : super(Start()) {
    on<Click>(_resetPassword);
  }
  static ResetPasswordBloc of(context) => BlocProvider.of(context);

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  _resetPassword(AppEvent event, Emitter<AppState> emit) async {
    final code = VerificationBloc.of(RouteUtils.context).codeController.text;
    emit(Loading());
    Map<String, dynamic> body = {
      "code": code,
      "password": password.text,
      "password_confirmation": confirmPassword.text,
    };
    try {
      log("VerificationController: $code");
      Response response =
          await ResetPasswordRepository.resetPassword(body: body);
      if (response.statusCode == 200) {
        log("Done ${response.statusCode}");
        emit(Done());
      } else {
        log("error ${response.statusCode}");
        emit(Error());
      }
    } catch (e) {
      log("error from the catch part: $e");
    }
  }
}
