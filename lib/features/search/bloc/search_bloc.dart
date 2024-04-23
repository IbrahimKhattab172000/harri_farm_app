// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/search/models/search_model.dart';
import 'package:harri_farm_app/features/search/repository/search_repository.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class SearchBloc extends Bloc<AppEvent, AppState> {
  SearchBloc() : super(Start()) {
    on<Get>(_getData);
  }
  static SearchBloc of(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SearchModel searchData = SearchModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    if (!formKey.currentState!.validate()) return;

    emit(Loading());

    String searchQuery = searchController.text;

    try {
      Response response =
          await SearchRepository.getData(searchQuery: searchQuery);
      if (response.statusCode == 200) {
        log("Done home${response.statusCode}");
        searchData = SearchModel.fromJson(response.data);

        emit(Done());
        SearchBloc bloc = SearchBloc.of(RouteUtils.context);
        bloc.searchController.clear();

        // print(" First " + searchData.data![0].toString());
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
