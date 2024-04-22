import 'package:harri_farm_app/main_models/product_model.dart';

class FavouriteModel {
  bool? success;
  Data? data;
  String? message;

  FavouriteModel({this.success, this.data, this.message});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
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
  List<ProductModel>? product;

  Data({this.product});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <ProductModel>[];
      json['product'].forEach((v) {
        product!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
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

  Product(
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

  Product.fromJson(Map<String, dynamic> json) {
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

class Addition {
  int? id;
  String? name;
  String? price;

  Addition({this.id, this.name, this.price});

  Addition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}

class Sizes {
  int? id;
  String? name;
  String? price;
  String? priceAfterDiscount;

  Sizes({this.id, this.name, this.price, this.priceAfterDiscount});

  Sizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['price_after_discount'] = priceAfterDiscount;
    return data;
  }
}

class SimilarProduct {
  int? id;
  String? name;
  String? price;
  String? discount;
  String? discountType;
  String? category;
  String? offerPrice;
  String? description;
  String? image;
  bool? like;
  int? rateavg;

  SimilarProduct(
      {this.id,
      this.name,
      this.price,
      this.discount,
      this.discountType,
      this.category,
      this.offerPrice,
      this.description,
      this.image,
      this.like,
      this.rateavg});

  SimilarProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discount = json['discount'];
    discountType = json['discountType'];
    category = json['category'];
    offerPrice = json['offer_price'];
    description = json['description'];
    image = json['image'];
    like = json['like'];
    rateavg = json['rateavg'];
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
    data['description'] = description;
    data['image'] = image;
    data['like'] = like;
    data['rateavg'] = rateavg;
    return data;
  }
}

class OrderType {
  int? id;
  String? name;

  OrderType({this.id, this.name});

  OrderType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
