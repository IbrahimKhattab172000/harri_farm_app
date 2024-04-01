// ignore_for_file: prefer_collection_literals

class UserModel {
  bool? success;
  Data? data;
  String? message;

  UserModel({this.success, this.data, this.message});

  UserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? name;
  int? userId;
  String? phone;
  int? isVerified;
  String? token;

  Data({this.name, this.userId, this.phone, this.isVerified, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    userId = json['user_id'];
    phone = json['phone'];
    isVerified = json['isVerified'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['user_id'] = userId;
    data['phone'] = phone;
    data['isVerified'] = isVerified;
    data['token'] = token;
    return data;
  }
}
