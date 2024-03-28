import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/forgot_password/repository/forget_password_repository.dart';

class ForgetPasswordBloc extends Bloc<AppEvent, AppState> {
  ForgetPasswordBloc() : super(Start()) {
    on<Click>(_sendCode);
  }
  static ForgetPasswordBloc of(context) => BlocProvider.of(context);

  TextEditingController emailOrPhone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _sendCode(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    String body = emailOrPhone.text;
    try {
      Response response = await ForgetPasswordRepository.sendCode(body: body);
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
