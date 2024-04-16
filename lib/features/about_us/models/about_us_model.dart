class AboutUsModel {
  bool? success;
  Data? data;
  String? message;

  AboutUsModel({this.success, this.data, this.message});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
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
  String? about;
  String? ourVision;
  String? ourValues;
  String? ourMesages;

  Data({this.id, this.about, this.ourVision, this.ourValues, this.ourMesages});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    about = json['about'];
    ourVision = json['our_vision'];
    ourValues = json['our_values'];
    ourMesages = json['our_mesages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['about'] = about;
    data['our_vision'] = ourVision;
    data['our_values'] = ourValues;
    data['our_mesages'] = ourMesages;
    return data;
  }
}
