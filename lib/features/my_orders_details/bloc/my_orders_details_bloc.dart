import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/my_orders_details/models/my_orders_details_model.dart';
import 'package:harri_farm_app/features/my_orders_details/repository/my_orders_details_repository.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class MyOrdersDetailsBloc extends Bloc<AppEvent, AppState> {
  MyOrdersDetailsBloc() : super(Start()) {
    on<Click>(_getOrderDetailsData);
  }

  static MyOrdersDetailsBloc of(context) => BlocProvider.of(context);

  MyOrderDetailsModel myOrdersDetailsData = MyOrderDetailsModel();

  _getOrderDetailsData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await MyOrdersDetailsRepository.getMyOrdersDetails(
          orderId: event.arguments.toString());
      if (response.statusCode == 200) {
        log("Done my orders details${response.statusCode}");
        myOrdersDetailsData = MyOrderDetailsModel.fromJson(response.data);

        emit(Done());
      } else {
        emit(Error());

        log("Error  my orders details ${response.statusCode}");
        showSnackBar(response.data['message'], errorMessage: true);
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part  my orders details: $e");

      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
