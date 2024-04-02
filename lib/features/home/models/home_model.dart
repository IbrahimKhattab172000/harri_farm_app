class HomeModel {
  bool? success;
  List<CategoryModel>? category;
  List<ProductModel>? products;
  List<BannerModel>? banner;
  List<dynamic>? offer;
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
      offer = data['offer'];
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
      'offer': offer,
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
