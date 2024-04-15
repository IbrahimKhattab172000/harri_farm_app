// ignore_for_file: public_member_api_docs, sort_constructors_first
class RatingModel {
  final String? order;
  final String? service;
  final String? deliverySpeed;
  final String? satisfaction;
  final String? comment;

  RatingModel({
    this.order,
    this.service,
    this.deliverySpeed,
    this.satisfaction,
    this.comment,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      order: json['order'],
      service: json['service'],
      deliverySpeed: json['deliverySpeed'],
      satisfaction: json['satisfaction'],
      comment: json['comment'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'order': order,
      'service': service,
      'deliverySpeed': deliverySpeed,
      'satisfaction': satisfaction,
      'comment': comment,
    };
  }

  RatingModel copyWith({
    String? order,
    String? ordeId,
    String? service,
    String? deliverySpeed,
    String? satisfaction,
    String? comment,
  }) {
    return RatingModel(
      order: order ?? this.order,
      service: service ?? this.service,
      deliverySpeed: deliverySpeed ?? this.deliverySpeed,
      satisfaction: satisfaction ?? this.satisfaction,
      comment: comment ?? this.comment,
    );
  }
}
