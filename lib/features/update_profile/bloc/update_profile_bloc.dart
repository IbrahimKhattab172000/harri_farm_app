// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/update_profile/models/update_profile_model.dart';
import 'package:harri_farm_app/features/update_profile/repository/update_profile_repository.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_dialog.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

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
  var updateProfileFormKey =
      GlobalKey<FormState>(debugLabel: "updateProfileFormKey");

  _getUser(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());

    try {
      Response response = await UpdateProfileRepository.getData();
      if (response.statusCode == 200) {
        userData = UpdateProfileModel.fromJson(response.data);

        emit(Done());
        log(response.statusCode.toString());
        showSnackBar(response.data['message'], errorMessage: false);
        name.clear();
        phone.clear();
        email.clear();
      } else {
        if ("${response.data['message']}" == "Unauthenticated.") {
          emit(UnAuthorized());
          // showSnackBar(response.data['message'], errorMessage: true);
          AppDialog.show(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 40.height),
                  AppText(
                    title: "sign_up_to_access_this_data".tr(),
                    color: AppColors.gray,
                  ),
                  SizedBox(height: 40.height),
                ],
              ),
            ),
          );
        } else {
          emit(Error());
          log("FROM ELSE get profile${response.statusCode}");
          showSnackBar(response.data['message'], errorMessage: true);
        }
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
