// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/contact_us/models/contact_us_model.dart';
import 'package:harri_farm_app/features/contact_us/repository/contact_us_repository.dart';
import 'package:harri_farm_app/helpers/routes.dart';

class ContactUsBloc extends Bloc<AppEvent, AppState> {
  ContactUsBloc() : super(Start()) {
    on<Click>(_addData);
    on<Get>(_getData);
  }
  static ContactUsBloc of(context) => BlocProvider.of(context);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  ContactUsModel contactUsModel = ContactUsModel();

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

        ContactUsBloc bloc = ContactUsBloc.of(RouteUtils.context);
        bloc.nameController.clear();
        bloc.phoneController.clear();
        bloc.emailController.clear();
        bloc.messageController.clear();
      } else {
        emit(Error());
        log('Posted Contact Us data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in posting Contact Us data ${e.toString()}");
    }
  }

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());

    try {
      Response response = await ContactUsRepository.getData();
      if (response.statusCode == 200) {
        contactUsModel = ContactUsModel.fromJson(response.data);
        log('Get Contact Us data Successfuly ');
        emit(Done());
        // RouteUtils.pop();
      } else {
        emit(Error());
        log('Get Contact Us data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in Getting Contact Us data ${e.toString()}");
    }
  }
}
