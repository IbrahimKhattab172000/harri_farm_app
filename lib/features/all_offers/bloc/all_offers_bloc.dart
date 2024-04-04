import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/all_offers/models/all_offers_model.dart';
import 'package:harri_farm_app/features/all_offers/repository/all_offers_repository.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class AllOffersBloc extends Bloc<AppEvent, AppState> {
  AllOffersBloc() : super(Loading()) {
    on<Get>(_getData);
  }
  static AllOffersBloc of(context) => BlocProvider.of(context);

  AllOfferModel allOffersData = AllOfferModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await AllOffersRepository.getData();
      if (response.statusCode == 200) {
        log("Done all offers${response.statusCode}");

        emit(Done());
        allOffersData = AllOfferModel.fromJson(response.data);
        print(" First " + allOffersData.data!.offers.toString());
      } else {
        emit(Error());

        log("Error all offers ${response.statusCode}");
        showSnackBar(response.data['message'], errorMessage: true);
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part home: $e");

      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
