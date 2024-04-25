// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/favorite/models/favorite_model.dart';
import 'package:harri_farm_app/features/favorite/repository/favorite_repository.dart';
import 'package:harri_farm_app/features/home/bloc/home_bloc.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_dialog.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class FavouriteBloc extends Bloc<AppEvent, AppState> {
  FavouriteBloc() : super(Start()) {
    on<Get>(_getData);
    on<Click>(_toggleFavourite);
  }
  static FavouriteBloc of(context) => BlocProvider.of(context);
  FavouriteModel favouriteData = FavouriteModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await FavouriteRepository.getData();
      if (response.statusCode == 200) {
        favouriteData = FavouriteModel.fromJson(response.data);
        log('Get favourite data Successfuly');
        emit(Done());
        bool? isProductEmpty = favouriteData.data?.product?.isEmpty;

        if (isProductEmpty == true || isProductEmpty == null) {
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
          log('Get favourite data Failed with Status code ${response.statusCode}');
        }
      }
    } catch (e) {
      emit(Error());
      log("catch error in get favourite data ${e.toString()}");
    }
  }

  _toggleFavourite(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    Map<String, dynamic> body = event.arguments as Map<String, dynamic>;
    try {
      Response response = await FavouriteRepository.setFavorite(body: body);
      if (response.statusCode == 200) {
        log("Done fav details${response.statusCode}");
        HomeBloc.of(RouteUtils.context).add(Get());
        FavouriteBloc.of(RouteUtils.context).add(Get());

        emit(Done());
      } else {
        emit(Error());

        log("Error fav details ${response.statusCode}");
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part fav details: $e");
    }
  }
}
