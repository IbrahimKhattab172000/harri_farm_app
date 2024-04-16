import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/rate_service/models/rate_service_model.dart';
import 'package:harri_farm_app/features/rate_service/repository/service_rate_repository.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class RateServiceBloc extends Bloc<AppEvent, AppState> {
  RateServiceBloc() : super(Start()) {
    on<Click>(_sendRate);
  }

  static RateServiceBloc of(context) => BlocProvider.of(context);

  RatingModel ratingModel = RatingModel(
    comment: "No-Comment",
    deliverySpeed: "0",
    order: "0",
    satisfaction: "0",
    service: "0",
  );

  void fillBody({
    String? order,
    String? service,
    String? deliverySpeed,
    String? satisfaction,
    String? comment,
  }) {
    //!Here
    ratingModel = ratingModel.copyWith(
      order: order,
      comment: comment,
      service: service,
      deliverySpeed: deliverySpeed,
      satisfaction: satisfaction,
    );
  }

  printValues() {
    log(ratingModel.order.toString());
    log(ratingModel.service.toString());
    log(ratingModel.deliverySpeed.toString());
    log(ratingModel.satisfaction.toString());
    log(ratingModel.comment.toString());
  }

  void resetValues() {
    ratingModel = ratingModel.copyWith(
      comment: "No Comment",
      deliverySpeed: "0",
      order: "0",
      satisfaction: "0",
      service: "0",
    );
  }

  _sendRate(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    printValues();
    Map<String, dynamic> body = {
      "order": ratingModel.order,
      "order_id": event.arguments.toString(),
      "service": ratingModel.service,
      "deliverySpeed": ratingModel.deliverySpeed,
      "satisfaction": ratingModel.satisfaction,
      "comment": ratingModel.comment,
    };
    try {
      Response response = await RateServiceRepository.sendRate(body: body);
      if (response.statusCode == 200) {
        log("Done rate service ${response.statusCode}");

        emit(Done());

        showSnackBar("Thank you for submiting your feedback",
            errorMessage: false);
        resetValues();
        RouteUtils.pop();
      } else {
        emit(Error());

        log("Error rate service ${response.statusCode}");
        showSnackBar(response.data['message'], errorMessage: true);
        resetValues();
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part  rate service: $e");

      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
