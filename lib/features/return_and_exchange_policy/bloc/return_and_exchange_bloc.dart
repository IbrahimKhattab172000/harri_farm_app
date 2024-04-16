import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/return_and_exchange_policy/models/return_and_exchange_model.dart';
import 'package:harri_farm_app/features/return_and_exchange_policy/repository/return_and_exchange_repository.dart';

class ReturnAndExchangeBloc extends Bloc<AppEvent, AppState> {
  ReturnAndExchangeBloc() : super(Loading()) {
    on<Get>(_getData);
  }
  static ReturnAndExchangeBloc of(context) => BlocProvider.of(context);
  ReturnAndExchangeModel returnAndExchangeData = ReturnAndExchangeModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await ReturnAndExchangeRepository.getExchangePolicy();
      if (response.statusCode == 200) {
        returnAndExchangeData = ReturnAndExchangeModel.fromJson(response.data);
        log('Get exchange policy data Successfuly ');
        emit(Done());
      } else {
        emit(Error());
        log('Get exchange policy data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in get exchange policy data ${e.toString()}");
    }
  }
}
