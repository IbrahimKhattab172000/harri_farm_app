class ContactUsModel {
  bool? success;
  List<Data>? data;
  String? message;

  ContactUsModel({this.success, this.data, this.message});

  ContactUsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? address;
  String? email;
  String? phone;
  String? whatsapp;
  String? websiteUrl;
  String? appleUrl;
  String? androidUrl;
  String? twitter;
  String? snapchat;
  String? instagram;
  String? facebook;

  Data(
      {this.address,
      this.email,
      this.phone,
      this.whatsapp,
      this.websiteUrl,
      this.appleUrl,
      this.androidUrl,
      this.twitter,
      this.snapchat,
      this.instagram,
      this.facebook});

  Data.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    email = json['email'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    websiteUrl = json['website_url'];
    appleUrl = json['apple_url'];
    androidUrl = json['android_url'];
    twitter = json['twitter'];
    snapchat = json['snapchat'];
    instagram = json['instagram'];
    facebook = json['facebook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['email'] = email;
    data['phone'] = phone;
    data['whatsapp'] = whatsapp;
    data['website_url'] = websiteUrl;
    data['apple_url'] = appleUrl;
    data['android_url'] = androidUrl;
    data['twitter'] = twitter;
    data['snapchat'] = snapchat;
    data['instagram'] = instagram;
    data['facebook'] = facebook;
    return data;
  }
}
