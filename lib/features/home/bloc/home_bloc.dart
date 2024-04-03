import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/home/models/home_model.dart';
import 'package:harri_farm_app/features/home/repository/home_repository.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class HomeBloc extends Bloc<AppEvent, AppState> {
  HomeBloc() : super(Loading()) {
    on<Get>(_getData);
  }
  static HomeBloc of(context) => BlocProvider.of(context);

  HomeModel homeData = HomeModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await HomeRepository.getData();
      if (response.statusCode == 200) {
        log("Done home${response.statusCode}");

        emit(Done());
        homeData = HomeModel.fromMap(response.data);
        print(" First " + homeData.products![0].toString());
      } else {
        emit(Error());

        log("Error home ${response.statusCode}");
        showSnackBar(response.data['message'], errorMessage: true);
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part home: $e");

      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
