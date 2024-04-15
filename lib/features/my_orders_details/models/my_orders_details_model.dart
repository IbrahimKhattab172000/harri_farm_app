class MyOrderDetailsModel {
  bool? success;
  Data? data;
  String? message;

  MyOrderDetailsModel({this.success, this.data, this.message});

  MyOrderDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? name;
  String? phone;
  String? secondphone;
  String? address;
  String? addressDetails;
  String? buildingNumber;
  String? streetName;
  String? city;
  String? country;
  String? payment;
  String? date;
  String? time;
  String? total;
  String? status;
  List<Offers>? offers;
  bool? isRate;

  Data(
      {this.id,
      this.name,
      this.phone,
      this.secondphone,
      this.address,
      this.addressDetails,
      this.buildingNumber,
      this.streetName,
      this.city,
      this.country,
      this.payment,
      this.date,
      this.time,
      this.total,
      this.status,
      this.offers,
      this.isRate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    secondphone = json['secondphone'];
    address = json['address'];
    addressDetails = json['address_details'];
    buildingNumber = json['building_number'];
    streetName = json['street_name'];
    city = json['city'];
    country = json['country'];
    payment = json['payment'];
    date = json['date'];
    time = json['time'];
    total = json['total'];
    status = json['status'];
    if (json['offers'] != null) {
      offers = <Offers>[];
      json['offers'].forEach((v) {
        offers!.add(Offers.fromJson(v));
      });
    }
    isRate = json['is_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['secondphone'] = secondphone;
    data['address'] = address;
    data['address_details'] = addressDetails;
    data['building_number'] = buildingNumber;
    data['street_name'] = streetName;
    data['city'] = city;
    data['country'] = country;
    data['payment'] = payment;
    data['date'] = date;
    data['time'] = time;
    data['total'] = total;
    data['status'] = status;
    if (offers != null) {
      data['offers'] = offers!.map((v) => v.toJson()).toList();
    }
    data['is_rate'] = isRate;
    return data;
  }
}

class Offers {
  int? id;
  String? name;
  int? price;
  int? discount;
  String? discountType;
  String? category;
  String? offerPrice;
  int? rateavg;
  String? description;
  String? image;
  int? quantity;
  bool? like;
  String? wrapping;
  String? cutting;
  String? size;
  String? notes;
  String? excuteTime;
  String? orderType;

  Offers(
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
      this.wrapping,
      this.cutting,
      this.size,
      this.notes,
      this.excuteTime,
      this.orderType});

  Offers.fromJson(Map<String, dynamic> json) {
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
    wrapping = json['wrapping'];
    cutting = json['cutting'];
    size = json['size'];
    notes = json['notes'];
    excuteTime = json['excute_time'];
    orderType = json['orderType'];
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
    data['wrapping'] = wrapping;
    data['cutting'] = cutting;
    data['size'] = size;
    data['notes'] = notes;
    data['excute_time'] = excuteTime;
    data['orderType'] = orderType;
    return data;
  }
}
