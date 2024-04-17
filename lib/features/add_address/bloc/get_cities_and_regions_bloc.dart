import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/add_address/models/cities_and_address.dart';
import 'package:harri_farm_app/features/add_address/repository/add_address_repository.dart';

class CitiesAndRegionsBloc extends Bloc<AppEvent, AppState> {
  CitiesAndRegionsBloc() : super(Loading()) {
    on<Get>(_getCitiesData);
    on<Read>(_getRegionsData);
  }
  static CitiesAndRegionsBloc of(context) => BlocProvider.of(context);
  CitiesAndRegionsModel citiesData = CitiesAndRegionsModel();

  CitiesAndRegionsModel regionsData = CitiesAndRegionsModel();

  _getCitiesData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await AddAddressRepositroy.getCities();
      if (response.statusCode == 200) {
        citiesData = CitiesAndRegionsModel.fromJson(response.data);
        log('Get cities Successfuly ');
        emit(Done());
      } else {
        emit(Error());
        log('Get cities Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in cities data ${e.toString()}");
    }
  }

  _getRegionsData(AppEvent event, Emitter<AppState> emit) async {
    try {
      Response response = await AddAddressRepositroy.getRegions(
        cityId: event.arguments.toString(),
      );
      if (response.statusCode == 200) {
        regionsData = CitiesAndRegionsModel.fromJson(response.data);
        log('Get regions Successfuly ');
        emit(Done());
      } else {
        emit(Error());
        log('Get regions Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in regions data ${e.toString()}");
    }
  }
}
