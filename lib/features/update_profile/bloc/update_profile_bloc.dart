import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/update_profile/models/update_profile_model.dart';
import 'package:harri_farm_app/features/update_profile/repository/update_profile_repository.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class UpdateProfileBloc extends Bloc<AppEvent, AppState> {
  UpdateProfileBloc() : super(Start()) {
    on<Get>(_getUser);
    on<Click>(_updateUserData);
  }

  static UpdateProfileBloc of(context) => BlocProvider.of(context);
  UpdateProfileModel userData = UpdateProfileModel();

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _getUser(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());

    try {
      Response response = await UpdateProfileRepository.getData();
      if (response.statusCode == 200) {
        emit(Done());
        userData = UpdateProfileModel.fromJson(response.data);
        log(response.statusCode.toString());
        showSnackBar(response.data['message'], errorMessage: false);
      } else {
        emit(Error());
        log("FROM ELSE get profile${response.statusCode}");
        showSnackBar(response.data['message'], errorMessage: true);
      }
    } catch (e) {
      emit(Error());
      log("FROM CATCH get profile $e");
      showSnackBar(e.toString(), errorMessage: true);
    }
  }

  _updateUserData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    Map<String, dynamic> updatedData = {
      "name": name.text.isEmpty ? userData.data!.name.toString() : name.text,
      "email":
          email.text.isEmpty ? userData.data!.email.toString() : email.text,
      "phone":
          phone.text.isEmpty ? userData.data!.phone.toString() : phone.text,
    };
    try {
      Response response =
          await UpdateProfileRepository.updateProfile(updatedData: updatedData);
      if (response.statusCode == 200) {
        emit(Done());
        log(response.statusCode.toString());
        showSnackBar(response.data['message'], errorMessage: false);
      } else {
        emit(Error());
        log("FROM ELSE update profile${response.statusCode}");
        showSnackBar(response.data['message'], errorMessage: true);
      }
    } catch (e) {
      emit(Error());
      log("FROM CATCH update profile $e");
      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
