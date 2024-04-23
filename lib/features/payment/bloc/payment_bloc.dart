import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/payment/repository/payment_repository.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class PaymentBloc extends Bloc<AppEvent, AppState> {
  PaymentBloc() : super(Start()) {
    on<Add>(_addPaymentOrder);
  }
  static PaymentBloc of(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController extraPhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? addressId;
  TextEditingController noteController = TextEditingController();
  String? paymentType;

  _addPaymentOrder(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());
    try {
      Map<String, dynamic> body = {
        "name": nameController.text,
        "phone": phoneController.text,
        "secondphone": extraPhoneController.text,
        "email": emailController.text,
        "address_id": addressId,
        "note": noteController.text,
        "payment": paymentType,
      };
      Response response = await PaymentRepository.addPaymentOrder(body: body);
      if (response.statusCode == 200) {
        log('Add payment order Successfuly ');
        emit(Done());
        showSnackBar(response.data['message'], errorMessage: false);
      } else {
        emit(Error());
        log('Add payment order Failed with Status code ${response.statusCode}');
        showSnackBar(response.data['message'], errorMessage: true);
      }
    } catch (e) {
      emit(Error());
      log("catch error in for Adding payment order data ${e.toString()}");
      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
