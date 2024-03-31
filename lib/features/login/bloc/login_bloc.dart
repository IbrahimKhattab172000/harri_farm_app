import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/home/view/home_view.dart';
import 'package:harri_farm_app/features/login/repository/login_repository.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class LoginBloc extends Bloc<AppEvent, AppState> {
  LoginBloc() : super(Start()) {
    on<Click>(_login);
  }

  static LoginBloc of(context) => BlocProvider.of(context);

  TextEditingController emailOrPhone = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _login(AppEvent event, Emitter<AppState> emit) async {
    if (!formKey.currentState!.validate()) return;

    emit(Loading());

    Map<String, dynamic> body = {
      "data": emailOrPhone.text,
      "password": password.text,
    };
    try {
      Response response = await LoginRepository.login(body: body);

      if (response.statusCode == 200) {
        log("Done ${response.statusCode}");
        RouteUtils.navigateTo(const HomeView());
        emit(Done());
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
