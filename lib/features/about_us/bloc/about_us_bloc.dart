import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/about_us/models/about_us_model.dart';
import 'package:harri_farm_app/features/about_us/repository/about_us_repository.dart';

class AboutUsBloc extends Bloc<AppEvent, AppState> {
  AboutUsBloc() : super(Loading()) {
    on<Get>(_getData);
  }
  static AboutUsBloc of(context) => BlocProvider.of(context);
  AboutUsModel aboutUsData = AboutUsModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await AboutUsRepositroy.getAbouUsData();
      if (response.statusCode == 200) {
        aboutUsData = AboutUsModel.fromJson(response.data);
        log('Get about us data Successfuly ');
        emit(Done());
      } else {
        emit(Error());
        log('Get faqabout us data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in get about us data ${e.toString()}");
    }
  }
}
