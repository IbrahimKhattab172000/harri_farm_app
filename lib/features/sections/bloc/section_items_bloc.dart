import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/sections/bloc/sections_bloc.dart';
import 'package:harri_farm_app/features/sections/models/sections_offers_model.dart';
import 'package:harri_farm_app/features/sections/repository/sections_repository.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class SectionItemsBloc extends Bloc<AppEvent, AppState> {
  SectionItemsBloc() : super(Loading()) {
    on<Read>(_getSubCategoryOffersData);
    on<Click>(_filter);
  }
  static SectionItemsBloc of(context) => BlocProvider.of(context);

  String? catId;
  bool? isFiltering;

  SubCategoryOffersModel subcategoryOffersModel = SubCategoryOffersModel();

  _getSubCategoryOffersData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());

    try {
      Response response = await SectionsRepository.getSubCategoryOffersData(
          subId: event.arguments as String);
      if (response.statusCode == 200) {
        log("Done Sub category Offers ${response.statusCode}");

        emit(Done());
        subcategoryOffersModel = SubCategoryOffersModel.fromJson(response.data);
      } else {
        emit(Error());

        log("Error Sub category Offers ${response.statusCode}");
        showSnackBar(response.data['message'], errorMessage: true);
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part Sub category Offers: $e");

      showSnackBar(e.toString(), errorMessage: true);
    }
  }

  _filter(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());

    try {
      Response response = await SectionsRepository.filter(
        catId: SectionBloc.of(RouteUtils.context).catId ?? "0",
        filterId: event.arguments.toString(),
      );
      if (response.statusCode == 200) {
        log("Done filter ${response.statusCode}");

        emit(Done());
        subcategoryOffersModel = SubCategoryOffersModel.fromJson(response.data);
      } else {
        emit(Error());

        log("Error filter ${response.statusCode}");
        showSnackBar(response.data['message'], errorMessage: true);
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part filter: $e");

      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
