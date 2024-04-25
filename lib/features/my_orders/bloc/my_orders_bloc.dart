// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/my_orders/models/my_orders_model.dart';
import 'package:harri_farm_app/features/my_orders/repository/my_orders_repository.dart';
import 'package:harri_farm_app/helpers/colors.dart';
import 'package:harri_farm_app/helpers/dimentions.dart';
import 'package:harri_farm_app/widgets/app_dialog.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';
import 'package:harri_farm_app/widgets/app_text.dart';

class MyOrdersBloc extends Bloc<AppEvent, AppState> {
  MyOrdersBloc() : super(Loading()) {
    on<ChangeView>(_handleChangeView);
    on<Get>(_getData);
  }

  int currentViewIndex = 0;

  static MyOrdersBloc of(context) => BlocProvider.of(context);

  MyOrdersModel myOrdersData = MyOrdersModel();

  _handleChangeView(ChangeView event, Emitter<AppState> emit) {
    currentViewIndex = event.arguments as int;
    emit(Reload());
  }

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Response response = await MyOrdersRepository.getMyOrders();
      if (response.statusCode == 200) {
        log("Done my orders${response.statusCode}");
        myOrdersData = MyOrdersModel.fromJson(response.data);

        emit(Done());

        if (myOrdersData.data!.newOrder!.isEmpty &&
            myOrdersData.data!.payedOrder!.isEmpty) {
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

          log("Error  my orders ${response.statusCode}");
          showSnackBar(response.data['message'], errorMessage: true);
        }
      }
    } catch (e) {
      emit(Error());

      log("error from the catch part  my orders: $e");

      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
