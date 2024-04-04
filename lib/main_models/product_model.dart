import 'package:harri_farm_app/features/all_offers/models/all_offers_model.dart';

class ProductModel {
  int? id;
  String? name;
  String? price;
  String? discount;
  String? discountType;
  String? category;
  String? offerPrice;
  int? rateavg;
  String? description;
  String? image;
  int? quantity;
  bool? like;
  List<Addition>? addition;
  List<Addition>? wrapping;
  List<Addition>? cutting;
  List<Sizes>? sizes;
  List<SimilarProduct>? similarProduct;
  List<OrderType>? orderType;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.discount,
      this.discountType,
      this.category,
      this.offerPrice,
      this.rateavg,
      this.description,
      this.image,
      this.quantity,
      this.like,
      this.addition,
      this.wrapping,
      this.cutting,
      this.sizes,
      this.similarProduct,
      this.orderType});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discount = json['discount'];
    discountType = json['discountType'];
    category = json['category'];
    offerPrice = json['offer_price'];
    rateavg = json['rateavg'];
    description = json['description'];
    image = json['image'];
    quantity = json['quantity'];
    like = json['like'];
    if (json['addition'] != null) {
      addition = <Addition>[];
      json['addition'].forEach((v) {
        addition!.add(Addition.fromJson(v));
      });
    }
    if (json['wrapping'] != null) {
      wrapping = <Addition>[];
      json['wrapping'].forEach((v) {
        wrapping!.add(Addition.fromJson(v));
      });
    }
    if (json['cutting'] != null) {
      cutting = <Addition>[];
      json['cutting'].forEach((v) {
        cutting!.add(Addition.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      sizes = <Sizes>[];
      json['sizes'].forEach((v) {
        sizes!.add(Sizes.fromJson(v));
      });
    }
    if (json['similarProduct'] != null) {
      similarProduct = <SimilarProduct>[];
      json['similarProduct'].forEach((v) {
        similarProduct!.add(SimilarProduct.fromJson(v));
      });
    }
    if (json['OrderType'] != null) {
      orderType = <OrderType>[];
      json['OrderType'].forEach((v) {
        orderType!.add(OrderType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['discount'] = discount;
    data['discountType'] = discountType;
    data['category'] = category;
    data['offer_price'] = offerPrice;
    data['rateavg'] = rateavg;
    data['description'] = description;
    data['image'] = image;
    data['quantity'] = quantity;
    data['like'] = like;
    if (addition != null) {
      data['addition'] = addition!.map((v) => v.toJson()).toList();
    }
    if (wrapping != null) {
      data['wrapping'] = wrapping!.map((v) => v.toJson()).toList();
    }
    if (cutting != null) {
      data['cutting'] = cutting!.map((v) => v.toJson()).toList();
    }
    if (sizes != null) {
      data['sizes'] = sizes!.map((v) => v.toJson()).toList();
    }
    if (similarProduct != null) {
      data['similarProduct'] = similarProduct!.map((v) => v.toJson()).toList();
    }
    if (orderType != null) {
      data['OrderType'] = orderType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
