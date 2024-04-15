import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/rate_service/models/rate_service_model.dart';
import 'package:harri_farm_app/features/rate_service/repository/service_rate_repository.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class RateServiceBloc extends Bloc<AppEvent, AppState> {
  RateServiceBloc() : super(Start()) {
    on<Click>(_sendRate);
  }

  static RateServiceBloc of(context) => BlocProvider.of(context);

  TextEditingController commentController = TextEditingController();
  RatingModel? ratingModel;

  void fillBody({
    String? order,
    String? service,
    String? deliverySpeed,
    String? satisfaction,
    String? comment,
  }) {
    ratingModel?.copyWith(
      order: order ?? ratingModel?.order,
      comment: comment ?? ratingModel?.comment,
      service: service ?? ratingModel?.service,
      deliverySpeed: deliverySpeed ?? ratingModel?.deliverySpeed,
      satisfaction: satisfaction ?? ratingModel?.satisfaction,
    );

    // log(order.toString());
  }

  _sendRate(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());

    Map<String, dynamic> body = {
      "order": ratingModel?.order,
      "order_id": event.arguments.toString(),
      "service": ratingModel?.service,
      "deliverySpeed": ratingModel?.deliverySpeed,
      "satisfaction": ratingModel?.satisfaction,
      "comment": ratingModel?.comment,
    };
    try {
      // log(ratingModel.order.toString());
      // log(ratingModel.service.toString());
      // log(ratingModel.deliverySpeed.toString());
      // log(ratingModel.satisfaction.toString());
      // log(ratingModel.comment.toString());

      Response response = await RateServiceRepository.sendRate(body: body);
      if (response.statusCode == 200) {
        log("Done rate service${response.statusCode}");

        emit(Done());

        showSnackBar("Thank you for submiting your feedback",
            errorMessage: false);
      } else {
        emit(Error());

        log("Error rate service ${response.statusCode}");
        showSnackBar(response.data['message'], errorMessage: true);
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part  rate service: $e");

      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
