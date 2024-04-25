import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/addresses/models/addresses_model.dart';
import 'package:harri_farm_app/features/addresses/repository/addresses_repository.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_dialog.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

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
        bool? isAddressesEmpty = addressesData.addresses?.isEmpty;
        if (isAddressesEmpty == true || isAddressesEmpty == null) {
          emit(Empty());
        }
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
          log('Get Addresses Failed with Status code ${response.statusCode}');
        }
      }
    } catch (e) {
      emit(Error());
      log("catch error in get Addresses data ${e.toString()}");
    }
  }
}
