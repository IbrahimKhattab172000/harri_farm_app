class CitiesAndRegionsModel {
  bool? success;
  List<CitiesAndRegionsData>? data;
  String? message;

  CitiesAndRegionsModel({this.success, this.data, this.message});

  CitiesAndRegionsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <CitiesAndRegionsData>[];
      json['data'].forEach((v) {
        data!.add(CitiesAndRegionsData.fromJson(v));
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

class CitiesAndRegionsData {
  int? id;
  String? name;

  CitiesAndRegionsData({this.id, this.name});

  CitiesAndRegionsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
