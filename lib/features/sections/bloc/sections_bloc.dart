// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/sections/bloc/section_items_bloc.dart';
import 'package:harri_farm_app/features/sections/models/sections_model.dart';
import 'package:harri_farm_app/features/sections/models/sections_offers_model.dart';
import 'package:harri_farm_app/features/sections/repository/sections_repository.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class SectionBloc extends Bloc<AppEvent, AppState> {
  SectionBloc() : super(Loading()) {
    on<Get>(_getSubCategories);
  }
  static SectionBloc of(context) => BlocProvider.of(context);

  String? catId;
  SubCategoryModel subCategoryData = SubCategoryModel();

  SubCategoryOffersModel subcategoryOffersModel = SubCategoryOffersModel();
  _getSubCategories(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      catId = event.arguments as String;
      Response response = await SectionsRepository.getData(catId: catId!);
      if (response.statusCode == 200) {
        log("Done Sub category ${response.statusCode}");
        subCategoryData = SubCategoryModel.fromJson(response.data);

        emit(Done());

        SectionItemsBloc.of(RouteUtils.context).add(Read(
            arguments: subCategoryData.data?.subCategory![0].id.toString()));
      } else {
        emit(Error());

        log("Error Sub category ${response.statusCode}");
        showSnackBar(response.data['message'], errorMessage: false);
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part Sub category: $e");

      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
