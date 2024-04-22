import 'package:harri_farm_app/main_models/product_model.dart';

class ProductDetailsModel {
  bool? success;
  Data? data;
  String? message;

  ProductDetailsModel({this.success, this.data, this.message});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  ProductModel? offer;

  Data({this.offer});

  Data.fromJson(Map<String, dynamic> json) {
    offer = json['offer'] != null ? ProductModel.fromJson(json['offer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (offer != null) {
      data['offer'] = offer!.toJson();
    }
    return data;
  }
}
