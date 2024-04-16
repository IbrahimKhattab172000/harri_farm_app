import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/privacy_policy/models/privacy_policy_model.dart';
import 'package:harri_farm_app/features/privacy_policy/repository/privacy_policy_repository.dart';

class PrivacyPolicyBloc extends Bloc<AppEvent, AppState> {
  PrivacyPolicyBloc() : super(Loading()) {
    on<Get>(_getData);
  }
  static PrivacyPolicyBloc of(context) => BlocProvider.of(context);
  PrivacyPolicyModel privacyPolicyData = PrivacyPolicyModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await PrivacyPolicyRepository.getPrivacyPolicy();
      if (response.statusCode == 200) {
        privacyPolicyData = PrivacyPolicyModel.fromJson(response.data);
        log('Get privacy policy data Successfuly ');
        emit(Done());
      } else {
        emit(Error());
        log('Get privacy policy data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in get privacy policy data ${e.toString()}");
    }
  }
}
