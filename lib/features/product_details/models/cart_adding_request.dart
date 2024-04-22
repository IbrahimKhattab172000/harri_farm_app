class CartAddingRequestModel {
  final String quantity;
  final String wrappingId;
  final String cuttingId;
  final String addition;
  final String orderTypeId;
  final DateTime executeTime;

  CartAddingRequestModel({
    required this.quantity,
    required this.wrappingId,
    required this.cuttingId,
    required this.addition,
    required this.orderTypeId,
    required this.executeTime,
  });

  Map<String, dynamic> toJson() {
    return {
      "quantity": quantity,
      "wrapping_id": wrappingId,
      "cutting_id": cuttingId,
      "addition[]": addition,
      "order_type_id": orderTypeId,
      "excute_time": executeTime.toIso8601String(),
    };
  }

  CartAddingRequestModel copyWith({
    String? offerId,
    String? quantity,
    String? sizeId,
    String? wrappingId,
    String? cuttingId,
    String? addition,
    String? orderTypeId,
    DateTime? executeTime,
  }) {
    return CartAddingRequestModel(
      quantity: quantity ?? this.quantity,
      wrappingId: wrappingId ?? this.wrappingId,
      cuttingId: cuttingId ?? this.cuttingId,
      addition: addition ?? this.addition,
      orderTypeId: orderTypeId ?? this.orderTypeId,
      executeTime: executeTime ?? this.executeTime,
    );
  }
}
