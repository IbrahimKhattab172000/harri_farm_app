class CartModel {
  bool? success;
  Data? data;
  String? message;

  CartModel({this.success, this.data, this.message});

  CartModel.fromJson(Map<String, dynamic> json) {
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
  List<Cart>? carts;
  String? totalPriceBefore;
  String? totalPriceAfter;
  String? discount;
  String? taxVal;
  String? tax;
  String? service;
  String? ultimate;
  String? couponDiscount;
  bool? couponStatus;

  Data({
    this.carts,
    this.totalPriceBefore,
    this.totalPriceAfter,
    this.discount,
    this.taxVal,
    this.tax,
    this.service,
    this.ultimate,
    this.couponDiscount,
    this.couponStatus,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['cart'] != null) {
      carts = <Cart>[];
      json['cart'].forEach((v) {
        carts!.add(Cart.fromJson(v));
      });
    }
    totalPriceBefore = json['total_price_before'];
    totalPriceAfter = json['total_price_after'];
    discount = json['discount'];
    taxVal = json['taxVal'];
    tax = json['tax'];
    service = json['service'];
    ultimate = json['final'];
    couponDiscount = json['couponDiscount'];
    couponStatus = json['couponStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (carts != null) {
      data['cart'] = carts!.map((v) => v.toJson()).toList();
    }
    data['total_price_before'] = totalPriceBefore;
    data['total_price_after'] = totalPriceAfter;
    data['discount'] = discount;
    data['taxVal'] = taxVal;
    data['tax'] = tax;
    data['service'] = service;
    data['final'] = ultimate;
    data['couponDiscount'] = couponDiscount;
    data['couponStatus'] = couponStatus;
    return data;
  }
}

class Cart {
  int? id;
  String? quantity;
  String? price;
  String? totalPriceBefore;
  String? totalPriceAfter;
  String? image;
  String? name;
  String? description;
  String? sizeName;
  String? cutting;
  String? wrapping;
  List<Addition>? addition;
  String? excuteTime;

  Cart(
      {this.id,
      this.quantity,
      this.price,
      this.totalPriceBefore,
      this.totalPriceAfter,
      this.image,
      this.name,
      this.description,
      this.sizeName,
      this.cutting,
      this.wrapping,
      this.addition,
      this.excuteTime});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    totalPriceBefore = json['total_price_before'];
    totalPriceAfter = json['total_price_after'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    sizeName = json['sizeName'];
    cutting = json['cutting'];
    wrapping = json['wrapping'];
    if (json['addition'] != null) {
      addition = <Addition>[];
      json['addition'].forEach((v) {
        addition!.add(Addition.fromJson(v));
      });
    }
    excuteTime = json['excute_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['price'] = price;
    data['total_price_before'] = totalPriceBefore;
    data['total_price_after'] = totalPriceAfter;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['sizeName'] = sizeName;
    data['cutting'] = cutting;
    data['wrapping'] = wrapping;
    if (addition != null) {
      data['addition'] = addition!.map((v) => v.toJson()).toList();
    }
    data['excute_time'] = excuteTime;
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
