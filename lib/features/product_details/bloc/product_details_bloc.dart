import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/core/app_event.dart';
import 'package:harri_farm_app/core/app_state.dart';
import 'package:harri_farm_app/features/cart/view/cart_view.dart';
import 'package:harri_farm_app/features/product_details/models/cart_adding_request.dart';
import 'package:harri_farm_app/features/product_details/models/product_details_model.dart';
import 'package:harri_farm_app/features/product_details/repository/product_details_repository.dart';
import 'package:harri_farm_app/helpers/routes.dart';
import 'package:harri_farm_app/widgets/app_snack_bar.dart';

class ProductDetailsBloc extends Bloc<AppEvent, AppState> {
  ProductDetailsBloc() : super(Loading()) {
    on<Get>(_getData);
    on<Click>(_addToCart);
  }

  CartAddingRequestModel cartAddingRequestModel = CartAddingRequestModel(
    addition: "",
    cuttingId: "",
    orderTypeId: "",
    quantity: "1",
    wrappingId: "",
    executeTime: DateTime.now(),
  );

  void fillBody({
    String? addition,
    String? cuttingId,
    String? orderTypeId,
    String? quantity,
    String? wrappingId,
    DateTime? executeTime,
  }) {
    cartAddingRequestModel = cartAddingRequestModel.copyWith(
      addition: addition,
      cuttingId: cuttingId,
      orderTypeId: orderTypeId,
      quantity: quantity,
      wrappingId: wrappingId,
      executeTime: executeTime,
    );
  }

  void resetValues() {
    cartAddingRequestModel = cartAddingRequestModel.copyWith(
      addition: "",
      cuttingId: "",
      orderTypeId: "",
      quantity: "1",
      wrappingId: "",
      executeTime: DateTime.now(),
    );
  }

  static ProductDetailsBloc of(context) => BlocProvider.of(context);
  ProductDetailsModel productDetailsData = ProductDetailsModel();

  _getData(AppEvent event, Emitter<AppState> emit) async {
    emit(Loading());

    try {
      Response response = await ProductDetailsRepo.getOfferDetailsData(
        offerId: event.arguments.toString(),
      );
      if (response.statusCode == 200) {
        productDetailsData = ProductDetailsModel.fromJson(response.data);
        log(" Test: ${productDetailsData.data?.offer?.image ?? ""}");
        log('Get product details  data Successfuly ');
        emit(Done());
      } else {
        emit(Error());
        log('Get product details  data Failed with Status code ${response.statusCode}');
      }
    } catch (e) {
      emit(Error());
      log("catch error in get product details data ${e.toString()}");
    }
  }

  _addToCart(AppEvent event, Emitter<AppState> emit) async {
    Map<String, dynamic> arguments = event.arguments as Map<String, dynamic>;

    String offerId = arguments['offer_id'] as String;
    String sizeId = arguments['size_id'] as String;

    Map<String, dynamic> body = {
      "offer_id": offerId,
      "quantity": cartAddingRequestModel.quantity,
      "size_id": sizeId,
      "wrapping_id": cartAddingRequestModel.wrappingId,
      "cutting_id": cartAddingRequestModel.cuttingId,
      "addition[]": cartAddingRequestModel.addition,
      "order_type_id": cartAddingRequestModel.orderTypeId,
      "execute_time": DateTime.now().toIso8601String(),
    };

    emit(Loading());
    try {
      Response response = await ProductDetailsRepo.addToCart(
        body: body,
      );
      if (response.statusCode == 200) {
        log('Add to cart data Successfuly ');
        emit(Done());
        showSnackBar(response.data['message'], errorMessage: false);

        resetValues();

        RouteUtils.navigateAndPopUntilFirstPage(const CartView());
      } else {
        emit(Error());
        log('Add to cart data Failed with Status code ${response.statusCode}');
        showSnackBar(response.data['message'], errorMessage: true);
      }
    } catch (e) {
      emit(Error());
      resetValues();

      log("catch error in Add to cart  data ${e.toString()}");
      showSnackBar(e.toString(), errorMessage: true);
    }
  }
}
