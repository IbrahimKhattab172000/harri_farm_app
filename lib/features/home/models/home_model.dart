// ignore_for_file: public_member_api_docs, sort_constructors_first

class HomeModel {
  bool? success;
  List<CategoryModel>? category;
  List<ProductModel>? products;
  List<BannerModel>? banner;
  List<Offer>? offer;
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
      offer = List<Offer>.from(
          (data['offer'] as List<dynamic>).map((x) => Offer.fromJson(x)));
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

class ProductModel {
  int? id;
  String? name;
  String? price;
  String? discount;
  String? discountType;
  String? category;
  String? offerPrice;
  double? rateAvg;
  String? description;
  String? image;
  int? quantity;
  bool? like;
  List<Map<String, dynamic>>? addition;
  List<Map<String, dynamic>>? wrapping;
  List<Map<String, dynamic>>? cutting;
  List<Map<String, dynamic>>? sizes;
  List<Map<String, dynamic>>? similarProduct;
  List<Map<String, dynamic>>? orderType;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.discount,
    this.discountType,
    this.category,
    this.offerPrice,
    this.rateAvg,
    this.description,
    this.image,
    this.quantity,
    this.like,
    this.addition,
    this.wrapping,
    this.cutting,
    this.sizes,
    this.similarProduct,
    this.orderType,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      discount: json['discount'],
      discountType: json['discountType'],
      category: json['category'],
      offerPrice: json['offer_price'],
      rateAvg: json['rateavg'].toDouble(),
      description: json['description'],
      image: json['image'],
      quantity: json['quantity'],
      like: json['like'],
      addition: List<Map<String, dynamic>>.from(
          json['addition']?.map((x) => x) ?? []),
      wrapping: List<Map<String, dynamic>>.from(
          json['wrapping']?.map((x) => x) ?? []),
      cutting:
          List<Map<String, dynamic>>.from(json['cutting']?.map((x) => x) ?? []),
      sizes:
          List<Map<String, dynamic>>.from(json['sizes']?.map((x) => x) ?? []),
      similarProduct: List<Map<String, dynamic>>.from(
          json['similarProduct']?.map((x) => x) ?? []),
      orderType: List<Map<String, dynamic>>.from(
          json['OrderType']?.map((x) => x) ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['discount'] = discount;
    data['discountType'] = discountType;
    data['category'] = category;
    data['offer_price'] = offerPrice;
    data['rateavg'] = rateAvg;
    data['description'] = description;
    data['image'] = image;
    data['quantity'] = quantity;
    data['like'] = like;
    data['addition'] = addition;
    data['wrapping'] = wrapping;
    data['cutting'] = cutting;
    data['sizes'] = sizes;
    data['similarProduct'] = similarProduct;
    data['OrderType'] = orderType;
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

class Offer {
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

  Offer({
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

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'discount': discount,
      'discountType': discountType,
      'category': category,
      'offerPrice': offerPrice,
      'rateavg': rateavg,
      'description': description,
      'image': image,
      'quantity': quantity,
      'like': like,
      'addition': addition.map((x) => x.toMap()).toList(),
      'wrapping': wrapping.map((x) => x.toMap()).toList(),
      'cutting': cutting.map((x) => x.toMap()).toList(),
      'sizes': sizes.map((x) => x.toMap()).toList(),
      'similarProduct': similarProduct.map((x) => x.toMap()).toList(),
      'orderType': orderType.map((x) => x.toMap()).toList(),
    };
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
