import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/reset_password/view/reset_password_view.dart';
import 'package:harri_farm_app/features/verification/repository/verification_repository.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class VerificationBloc extends Bloc<AppEvent, AppState> {
  VerificationBloc() : super(Start()) {
    on<Click>(_verifyCode);
  }

  static VerificationBloc of(context) => BlocProvider.of(context);

  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _verifyCode(AppEvent event, Emitter<AppState> emit) async {
    if (!formKey.currentState!.validate()) return;

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
        RouteUtils.navigateTo(const ResetPasswordView());
      } else {
        log("Error ${response.statusCode}");
        showSnackBar(response.statusMessage.toString(), errorMessage: true);

        emit(Error());
      }
    } catch (e) {
      log("error from the catch part: $e");
      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
