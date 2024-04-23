import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/addresses/models/addresses_model.dart';
import 'package:harri_farm_app/features/shipping_address/repository/shipping_address_repository.dart';

class ShippingAddressBloc extends Bloc<AppEvent, AppState> {
  ShippingAddressBloc() : super(Loading()) {
    on<Get>(_getAddressesShippingData);
  }
  static ShippingAddressBloc of(context) => BlocProvider.of(context);
  AddressesModel addressesData = AddressesModel();

  Map<String, dynamic> cachedInfo = {};
  _getAddressesShippingData(AppEvent event, Emitter<AppState> emit) async {
    // final paymentBlocKey = PaymentBloc.of(RouteUtils.context).paymentKey;
    // if (!paymentBlocKey.currentState!.validate()) return;

    emit(Loading());
    try {
      Response response =
          await ShippingAddressRepositroy.getAddressDataShipping();
      if (response.statusCode == 200) {
        addressesData = AddressesModel.fromJson(response.data);
        log('Get addresses for shipping Successfuly ');
        emit(Done());
      } else {
        emit(Error());
        log('Get addresses for shipping Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in for getting shipping addresses data ${e.toString()}");
    }
  }

  // _saveShippingData(AppEvent event, Emitter<AppState> emit) async {
  //   cachedInfo = {
  //     "name": nameController.text,
  //     "phone": phoneController.text,
  //     "secondphone": extraPhoneController.text,
  //     "email": emailController.text,
  //     "address_id": addressId,
  //     "note": noteController.text,
  //   };

  //   cachedInfo.forEach((key, value) {
  //     print('$key: $value');
  //   });
  // }
}
