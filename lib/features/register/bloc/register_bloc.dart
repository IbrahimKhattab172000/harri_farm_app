// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/core/app_storage.dart';
import 'package:harri_farm_app/features/register/repository/register_repository.dart';
import 'package:harri_farm_app/features/verification/view/verification_view.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

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

  var formKey = GlobalKey<FormState>();

  //============================================================================
  //============================================================================  Functions
  //============================================================================

  _addUser(AppEvent event, Emitter<AppState> emit) async {
    if (!formKey.currentState!.validate()) return;

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
        AppStorage.cacheId(response.data["data"]["user_id"]);
        RouteUtils.navigateTo(const VerificationView(isVerified: true));
        log(response.statusCode.toString());
        showSnackBar(response.data['message'], errorMessage: false);
        RegisterBloc bloc = RegisterBloc.of(RouteUtils.context);
        bloc.name.clear();
        bloc.phone.clear();
        bloc.email.clear();
        bloc.password.clear();
        bloc.passwordConfirmation.clear();
      } else {
        emit(Error());
        log("FROM ELSE ${response.statusCode}");
        showSnackBar(response.data['message'], errorMessage: true);
      }
    } catch (e) {
      emit(Error());
      log("FROM CATCH $e");
      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
