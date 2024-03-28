import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/register/repository/register_repository.dart';

class RegisterBloc extends Bloc<AppEvent, AppState> {
  RegisterBloc() : super(Start()) {
    on<Click>(_addUser);
  }

  static RegisterBloc of(context) => BlocProvider.of(context);

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  //============================================================================
  //============================================================================  Functions
  //============================================================================

  _addUser(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    Map<String, dynamic> body = {
      "name": name.text,
      "email": email.text,
      "phone": phone.text,
      "password": password.text,
      "password_confirmation": passwordConfirmation.text,
    };
    try {
      Response response = await SignupRepository.signUp(body: body);
      if (response.statusCode == 200) {
        emit(Done());
        log(response.statusCode.toString());
      } else {
        emit(Error());
        log(response.statusCode.toString());
      }
    } catch (e) {
      emit(Error());
      log(e.toString());
    }
  }
}
