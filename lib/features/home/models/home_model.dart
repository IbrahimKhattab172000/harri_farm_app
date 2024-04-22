// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:harri_farm_app/main_models/product_model.dart';

class HomeModel {
  bool? success;
  List<CategoryModel>? category;
  List<ProductModel>? products;
  List<BannerModel>? banner;
  List<ProductModel>? offer;
  AdvertModel? advert;
  int? notification;
  String? message;

  HomeModel({
    this.success,
    this.category,
    this.products,
    this.banner,
    this.offer,
    this.advert,
    this.notification,
    this.message,
  });

  HomeModel.fromMap(Map<String, dynamic> json) {
    success = json['success'];
    var data = json['data'];
    if (data != null) {
      category = List<CategoryModel>.from((data['category'] as List<dynamic>)
          .map((x) => CategoryModel.fromJson(x)));
      products = List<ProductModel>.from((data['products'] as List<dynamic>)
          .map((x) => ProductModel.fromJson(x)));
      banner = List<BannerModel>.from((data['banner'] as List<dynamic>)
          .map((x) => BannerModel.fromJson(x)));
      offer = List<ProductModel>.from((data['offer'] as List<dynamic>)
          .map((x) => ProductModel.fromJson(x)));
      advert = AdvertModel.fromJson(data['advert']);
      notification = data['notification'];
    }
    message = json['message'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['data'] = {
      'category': category?.map((x) => x.toJson()).toList(),
      'products': products?.map((x) => x.toJson()).toList(),
      'banner': banner?.map((x) => x.toJson()).toList(),
      'offer': offer?.map((x) => x.toJson()).toList(),
      'advert': advert?.toJson(),
      'notification': notification,
    };
    data['message'] = message;
    return data;
  }
}

class CategoryModel {
  int? id;
  String? name;
  String? image;
  String? color;
  String? numberProducts;

  CategoryModel({
    this.id,
    this.name,
    this.image,
    this.color,
    this.numberProducts,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      color: json['color'],
      numberProducts: json['Number_Products'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['color'] = color;
    data['Number_Products'] = numberProducts;
    return data;
  }
}

class BannerModel {
  int? id;
  String? name;
  String? url;
  String? image;

  BannerModel({
    this.id,
    this.name,
    this.url,
    this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['image'] = image;
    return data;
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
    };
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
    };
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
    };
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'price_after_discount': priceAfterDiscount,
    };
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'discount': discount,
      'discountType': discountType,
      'category': category,
      'offerPrice': offerPrice,
      'description': description,
      'image': image,
      'like': like,
      'rateavg': rateavg,
    };
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }
}

class AdvertModel {
  String? image;
  String? link;
  String? title;

  AdvertModel({
    this.image,
    this.link,
    this.title,
  });

  factory AdvertModel.fromJson(Map<String, dynamic> json) {
    return AdvertModel(
      image: json['image'],
      link: json['link'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['image'] = image;
    data['link'] = link;
    data['title'] = title;
    return data;
  }
}
