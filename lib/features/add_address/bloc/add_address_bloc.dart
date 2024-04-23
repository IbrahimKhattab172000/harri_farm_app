// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/add_address/repository/add_address_repository.dart';
import 'package:harri_farm_app/features/addresses/bloc/addresses_bloc.dart';
import 'package:harri_farm_app/helpers/routes.dart';

class AddAddressBloc extends Bloc<AppEvent, AppState> {
  AddAddressBloc() : super(Start()) {
    on<Click>(_addAddress);
  }
  static AddAddressBloc of(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressDetailsController = TextEditingController();
  TextEditingController neighborhoodController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  TextEditingController buildingNumberController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  String? cityId;
  String? countryId;

  // TextEditingController locationController = TextEditingController();

  _addAddress(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    Map<String, dynamic> body = {
      "name": nameController.text,
      "phone": phoneController.text,
      "address_details": addressDetailsController.text,
      "neighborhood": neighborhoodController.text,
      "street_name": streetNameController.text,
      "building_number": buildingNumberController.text,
      "notes": notesController.text,
      "lat": "23.885942",
      "lng": "45.079162",
      "city_id": cityId,
      "country_id": countryId,
    };
    try {
      Response response = await AddAddressRepositroy.addAddress(body: body);
      if (response.statusCode == 200) {
        log('Posted Address data Successfuly ');
        emit(Done());

        AddAddressBloc bloc = AddAddressBloc.of(RouteUtils.context);
        bloc.nameController.clear();
        bloc.phoneController.clear();
        bloc.addressDetailsController.clear();
        bloc.neighborhoodController.clear();
        bloc.streetNameController.clear();
        bloc.buildingNumberController.clear();
        bloc.notesController.clear();

        AddressesBloc.of(RouteUtils.context).add(Get());
      } else {
        emit(Error());
        log('Posted Address data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in posting Address data ${e.toString()}");
    }
  }
}
