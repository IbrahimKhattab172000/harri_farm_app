import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/faq/models/faq_model.dart';
import 'package:harri_farm_app/features/faq/repository/faq_repository.dart';

class FaqBloc extends Bloc<AppEvent, AppState> {
  FaqBloc() : super(Loading()) {
    on<Get>(_getData);
  }
  static FaqBloc of(context) => BlocProvider.of(context);
  FaqModel faqData = FaqModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await FaqRepository.getData();
      if (response.statusCode == 200) {
        faqData = FaqModel.fromJson(response.data);
        log('Get faq data Successfuly ');
        emit(Done());
      } else {
        emit(Error());
        log('Get faq data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in get faq data ${e.toString()}");
    }
  }
}
