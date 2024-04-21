import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/contact_us/repository/contact_us_repository.dart';
import 'package:harri_farm_app/helpers/routes.dart';

class ContactUsBloc extends Bloc<AppEvent, AppState> {
  ContactUsBloc() : super(Start()) {
    on<Click>(_addData);
  }
  static ContactUsBloc of(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  _addData(AppEvent event, Emitter<AppState> emit) async {
    if (!formKey.currentState!.validate()) return;

    emit(Loading());
    Map<String, dynamic> body = {
      "name": nameController.text,
      "phone": phoneController.text,
      "email": emailController.text,
      "message": messageController.text,
    };
    try {
      Response response = await ContactUsRepository.sendData(body: body);
      if (response.statusCode == 200) {
        log('Posted Contact Us data Successfuly ');
        emit(Done());
        // RouteUtils.pop();
      } else {
        emit(Error());
        log('Posted Contact Us data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in posting Contact Us data ${e.toString()}");
    }
  }
}
