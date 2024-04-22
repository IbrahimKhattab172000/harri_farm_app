// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/cart/repository/cart_repository.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class CartCouponBloc extends Bloc<AppEvent, AppState> {
  CartCouponBloc() : super(Start()) {
    on<Click>(_addCoupon);
  }
  static CartCouponBloc of(context) => BlocProvider.of(context);
  var cartCouponBlocKey = GlobalKey<FormState>();

  TextEditingController couponController = TextEditingController();
  _addCoupon(AppEvent event, Emitter<AppState> emit) async {
    if (!cartCouponBlocKey.currentState!.validate()) return;

    emit(Loading());
    try {
      Response response =
          await CartRepository.addCoupon(code: couponController.text);
      if (response.statusCode == 200) {
        log('Add coupon data Successfuly');
        emit(Done());
        showSnackBar(response.data['message'], errorMessage: false);
      } else {
        emit(Error());
        log('Add coupon data Failed with Status code ${response.statusCode}');
        showSnackBar(response.data['message'], errorMessage: true);
      }
    } catch (e) {
      emit(Error());
      log("catch cart in adding coupon data ${e.toString()}");
    }
  }
}
