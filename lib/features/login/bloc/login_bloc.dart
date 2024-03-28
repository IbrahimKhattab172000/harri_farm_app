import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/login/repository/login_repository.dart';

class LoginBloc extends Bloc<AppEvent, AppState> {
  LoginBloc() : super(Start()) {
    on<Click>(_login);
  }

  static LoginBloc of(context) => BlocProvider.of(context);

  TextEditingController emailOrPhone = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _login(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());

    Map<String, dynamic> body = {
      "data": emailOrPhone.text,
      "password": password.text,
    };
    try {
      Response response = await LoginRepository.login(body: body);

      if (response.statusCode == 200) {
        log("Done ${response.statusCode}");

        emit(Done());
      } else {
        log("Error ${response.statusCode}");

        emit(Error());
      }
    } catch (e) {
      log("error from the catch part: $e");
    }
  }
}
