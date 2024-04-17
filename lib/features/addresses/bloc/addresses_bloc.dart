import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/addresses/models/addresses_model.dart';
import 'package:harri_farm_app/features/addresses/repository/addresses_repository.dart';

class AddressesBloc extends Bloc<AppEvent, AppState> {
  AddressesBloc() : super(Loading()) {
    on<Get>(_getData);
  }
  static AddressesBloc of(context) => BlocProvider.of(context);
  AddressesModel addressesData = AddressesModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await AddressesRepositroy.getAddressData();
      if (response.statusCode == 200) {
        addressesData = AddressesModel.fromJson(response.data);
        log('Get Addresses data Successfuly ');
        emit(Done());
        // if (addressesData.data!.isEmpty) {
        //   emit(Empty());
        // }
      } else {
        emit(Error());
        log('Get Addresses Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in get Addresses data ${e.toString()}");
    }
  }
}
