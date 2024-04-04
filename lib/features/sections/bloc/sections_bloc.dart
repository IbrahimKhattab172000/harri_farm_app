import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/sections/models/sections_model.dart';
import 'package:harri_farm_app/features/sections/repository/sections_repository.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class SectionBloc extends Bloc<AppEvent, AppState> {
  SectionBloc() : super(Loading()) {
    on<Get>(_getData);
  }
  static SectionBloc of(context) => BlocProvider.of(context);

  SubCategoryModel subCategoryData = SubCategoryModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response =
          await SectionsRepository.getData(catId: event.arguments as String);
      if (response.statusCode == 200) {
        log("Done Sub category ${response.statusCode}");

        emit(Done());
        subCategoryData = SubCategoryModel.fromJson(response.data);
      } else {
        emit(Error());

        log("Error Sub category ${response.statusCode}");
        showSnackBar(response.data['message'], errorMessage: true);
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part Sub category: $e");

      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
