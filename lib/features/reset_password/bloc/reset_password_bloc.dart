import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/home/view/home_view.dart';
import 'package:harri_farm_app/features/reset_password/repository/reset_password_repository.dart';
import 'package:harri_farm_app/features/verification/bloc/verification_bloc.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class ResetPasswordBloc extends Bloc<AppEvent, AppState> {
  ResetPasswordBloc() : super(Start()) {
    on<Click>(_resetPassword);
  }
  static ResetPasswordBloc of(context) => BlocProvider.of(context);

  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  _resetPassword(AppEvent event, Emitter<AppState> emit) async {
    if (!formKey.currentState!.validate()) return;

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
        RouteUtils.navigateTo(const HomeView());
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
