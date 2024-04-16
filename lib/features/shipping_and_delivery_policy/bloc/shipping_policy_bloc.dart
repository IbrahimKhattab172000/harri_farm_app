import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/shipping_and_delivery_policy/models/shipping_policy_model.dart';
import 'package:harri_farm_app/features/shipping_and_delivery_policy/repository/shipping_policy_repository.dart';

class ShippingPolicyBloc extends Bloc<AppEvent, AppState> {
  ShippingPolicyBloc() : super(Loading()) {
    on<Get>(_getData);
  }
  static ShippingPolicyBloc of(context) => BlocProvider.of(context);
  ShippingPolicyModel shippingPolicyData = ShippingPolicyModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await ShippingPolicyRepository.getShippingPolicy();
      if (response.statusCode == 200) {
        shippingPolicyData = ShippingPolicyModel.fromJson(response.data);
        log('Get shipping policy data Successfuly ');
        emit(Done());
      } else {
        emit(Error());
        log('Get shipping policy data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in get shipping policy data ${e.toString()}");
    }
  }
}
