class SearchModel {
  bool? success;
  List<SearchItem>? data;
  String? message;

  SearchModel({this.success, this.data, this.message});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      success: json['success'],
      data: (json['data']['offer'] as List)
          .map((e) => SearchItem.fromJson(e))
          .toList(),
      message: json['message'],
    );
  }
}

class SearchItem {
  int id;
  String name;
  String price;
  String discount;
  String discountType;
  String category;
  String offerPrice;
  int rateavg;
  String description;
  String image;
  int quantity;
  bool like;
  List<Addition> addition;
  List<Wrapping> wrapping;
  List<Cutting> cutting;
  List<Sizes> sizes;
  List<SimilarProduct> similarProduct;
  List<OrderType> orderType;

  SearchItem({
    required this.id,
    required this.name,
    required this.price,
    required this.discount,
    required this.discountType,
    required this.category,
    required this.offerPrice,
    required this.rateavg,
    required this.description,
    required this.image,
    required this.quantity,
    required this.like,
    required this.addition,
    required this.wrapping,
    required this.cutting,
    required this.sizes,
    required this.similarProduct,
    required this.orderType,
  });

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      discount: json['discount'],
      discountType: json['discountType'],
      category: json['category'],
      offerPrice: json['offer_price'],
      rateavg: json['rateavg'],
      description: json['description'],
      image: json['image'],
      quantity: json['quantity'],
      like: json['like'],
      addition:
          (json['addition'] as List).map((e) => Addition.fromJson(e)).toList(),
      wrapping:
          (json['wrapping'] as List).map((e) => Wrapping.fromJson(e)).toList(),
      cutting:
          (json['cutting'] as List).map((e) => Cutting.fromJson(e)).toList(),
      sizes: (json['sizes'] as List).map((e) => Sizes.fromJson(e)).toList(),
      similarProduct: (json['similarProduct'] as List)
          .map((e) => SimilarProduct.fromJson(e))
          .toList(),
      orderType: (json['OrderType'] as List)
          .map((e) => OrderType.fromJson(e))
          .toList(),
    );
  }
}

class Addition {
  int id;
  String name;
  String price;

  Addition({required this.id, required this.name, required this.price});

  factory Addition.fromJson(Map<String, dynamic> json) {
    return Addition(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}

class Wrapping {
  int id;
  String name;
  String price;

  Wrapping({required this.id, required this.name, required this.price});

  factory Wrapping.fromJson(Map<String, dynamic> json) {
    return Wrapping(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}

class Cutting {
  int id;
  String name;
  String price;

  Cutting({required this.id, required this.name, required this.price});

  factory Cutting.fromJson(Map<String, dynamic> json) {
    return Cutting(
      id: json['id'],
      name: json['name'],
      price: json['price'],
    );
  }
}

class Sizes {
  int id;
  String name;
  String price;
  String priceAfterDiscount;

  Sizes(
      {required this.id,
      required this.name,
      required this.price,
      required this.priceAfterDiscount});

  factory Sizes.fromJson(Map<String, dynamic> json) {
    return Sizes(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      priceAfterDiscount: json['price_after_discount'],
    );
  }
}

class SimilarProduct {
  int id;
  String name;
  String price;
  String discount;
  String discountType;
  String category;
  String offerPrice;
  String description;
  String image;
  bool like;
  int rateavg;

  SimilarProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.discount,
    required this.discountType,
    required this.category,
    required this.offerPrice,
    required this.description,
    required this.image,
    required this.like,
    required this.rateavg,
  });

  factory SimilarProduct.fromJson(Map<String, dynamic> json) {
    return SimilarProduct(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      discount: json['discount'],
      discountType: json['discountType'],
      category: json['category'],
      offerPrice: json['offer_price'],
      description: json['description'],
      image: json['image'],
      like: json['like'],
      rateavg: json['rateavg'],
    );
  }
}

class OrderType {
  int id;
  String name;

  OrderType({required this.id, required this.name});

  factory OrderType.fromJson(Map<String, dynamic> json) {
    return OrderType(
      id: json['id'],
      name: json['name'],
    );
  }
}
