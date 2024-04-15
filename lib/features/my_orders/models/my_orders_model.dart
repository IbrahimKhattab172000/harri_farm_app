class MyOrdersModel {
  bool? success;
  Data? data;
  String? message;

  MyOrdersModel({this.success, this.data, this.message});

  MyOrdersModel.fromJson(Map<String, dynamic> json) {
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
  List<NewOrder>? newOrder;
  List<NewOrder>? payedOrder;

  Data({this.newOrder, this.payedOrder});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['newOrder'] != null) {
      newOrder = <NewOrder>[];
      json['newOrder'].forEach((v) {
        newOrder!.add(NewOrder.fromJson(v));
      });
    }
    if (json['payedOrder'] != null) {
      payedOrder = <NewOrder>[];
      json['payedOrder'].forEach((v) {
        payedOrder!.add(NewOrder.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (newOrder != null) {
      data['newOrder'] = newOrder!.map((v) => v.toJson()).toList();
    }
    if (payedOrder != null) {
      data['payedOrder'] = payedOrder!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NewOrder {
  int? id;
  String? date;
  String? finalPrice;
  String? note;
  String? status;

  NewOrder({this.id, this.date, this.finalPrice, this.note, this.status});

  NewOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    finalPrice = json['final_price'];
    note = json['note'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['final_price'] = finalPrice;
    data['note'] = note;
    data['status'] = status;
    return data;
  }
}
