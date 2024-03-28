import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/verification/repository/verification_repository.dart';

class VerificationBloc extends Bloc<AppEvent, AppState> {
  VerificationBloc() : super(Start()) {
    on<Click>(_verifyCode);
  }

  static VerificationBloc of(context) => BlocProvider.of(context);

  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _verifyCode(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    Map<String, dynamic> body = {
      "user_id": "119",
      "code": codeController.text,
    };
    try {
      Response response = await VerificationRepository.verifyCode(body: body);
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
