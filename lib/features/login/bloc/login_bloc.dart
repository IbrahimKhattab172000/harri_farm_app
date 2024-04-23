// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/core/app_storage.dart';
import 'package:harri_farm_app/features/home/view/home_view.dart';
import 'package:harri_farm_app/features/login/repository/login_repository.dart';
import 'package:harri_farm_app/features/verification/view/verification_view.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class LoginBloc extends Bloc<AppEvent, AppState> {
  LoginBloc() : super(Start()) {
    on<Click>(_login);
  }

  static LoginBloc of(context) => BlocProvider.of(context);

  TextEditingController emailOrPhone = TextEditingController();
  TextEditingController password = TextEditingController();

  var formKey = GlobalKey<FormState>();

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
        // await AppStorage.cacheUser(UserModel.fromJson(response.data));
        AppStorage.cacheToken(response.data['data']['token']);
        RouteUtils.navigateTo(const HomeView());
        LoginBloc bloc = LoginBloc.of(RouteUtils.context);
        bloc.emailOrPhone.clear();
        bloc.password.clear();

        emit(Done());
        showSnackBar(response.data['message'], errorMessage: false);
      } else if (
          // response.statusCode == 422 &&
          response.data['isVerified'] == 0) {
        emit(Done());
        if (response.data['isVerified'] == 0) {
          RouteUtils.navigateTo(const VerificationView(isVerified: true));
        }
      } else {
        emit(Error());
        log("Error ${response.statusCode}");
        showSnackBar(response.data['message'], errorMessage: true);
      }
    } catch (e) {
      log("error from the catch part: $e");
      showSnackBar(e.toString(), errorMessage: true);
      emit(Error());
    }
  }
}
