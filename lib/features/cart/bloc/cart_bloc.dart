// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/cart/models/cart_model.dart';
import 'package:harri_farm_app/features/cart/repository/cart_repository.dart';
import 'package:harri_farm_app/features/cart/view/cart_view.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_dialog.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class CartBloc extends Bloc<AppEvent, AppState> {
  CartBloc() : super(Start()) {
    on<Get>(_getData);
    on<Delete>(_deleteAllCartData);
    on<Clear>(_deleteItemCartData);
    on<Add>(_increaseCartItem);
    on<Click>(_decreaseCartItem);
  }
  static CartBloc of(context) => BlocProvider.of(context);
  CartModel cartModel = CartModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await CartRepository.getData();
      if (response.statusCode == 200) {
        cartModel = CartModel.fromJson(response.data);
        log('Get cart data Successfuly');
        emit(Done());
        bool? isCartEmpty = cartModel.data?.carts?.isEmpty;
        if (isCartEmpty == true || isCartEmpty == null) {
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
          log('Get cart data Failed with Status code ${response.statusCode}');
        }
      }
    } catch (e) {
      emit(Error());
      log("catch cart in get favourite data ${e.toString()}");
    }
  }

  _deleteAllCartData(AppEvent event, Emitter<AppState> emit) async {
    // emit(Loading());
    try {
      Response response = await CartRepository.deleteAllCartData();
      if (response.statusCode == 200) {
        log('Delete all cart data Successfuly');
        emit(Done());
        RouteUtils.navigateAndPopUntilFirstPage(const CartView());
      } else {
        emit(Error());
        log('Delete all cart Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch cart in Delete all cart ${e.toString()}");
    }
  }

  _deleteItemCartData(AppEvent event, Emitter<AppState> emit) async {
    // emit(Loading());
    try {
      Response response = await CartRepository.deleteItemCartData(
          offerId: event.arguments.toString());
      if (response.statusCode == 200) {
        log('Delete item cart data Successfuly');
        emit(Done());
        RouteUtils.navigateAndPopUntilFirstPage(const CartView());
      } else {
        emit(Error());
        log('Delete item cart Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch cart in Delete item cart ${e.toString()}");
    }
  }

  _increaseCartItem(AppEvent event, Emitter<AppState> emit) async {
    // emit(Loading());
    try {
      Response response = await CartRepository.increaseCartItem(
          offerId: event.arguments.toString());
      if (response.statusCode == 200) {
        log('Increase item cart data Successfuly');
        emit(Done());
        CartBloc.of(RouteUtils.context).add(Get());

        // RouteUtils.navigateAndPopUntilFirstPage(const CartView());
      } else {
        emit(Error());
        log('Increase item cart Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch cart in Increase item cart ${e.toString()}");
    }
  }

  _decreaseCartItem(AppEvent event, Emitter<AppState> emit) async {
    // emit(Loading());
    try {
      Response response = await CartRepository.decreaseCartItem(
          offerId: event.arguments.toString());
      if (response.statusCode == 200) {
        log('Increase item cart data Successfuly');
        emit(Done());
        CartBloc.of(RouteUtils.context).add(Get());

        // RouteUtils.navigateAndPopUntilFirstPage(const CartView());
      } else {
        emit(Error());
        log('Increase item cart Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch cart in Increase item cart ${e.toString()}");
    }
  }
}
