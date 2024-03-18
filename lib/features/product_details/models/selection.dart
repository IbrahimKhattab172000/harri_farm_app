class SelectionItem {
  final String label;
  final String? price;

  final dynamic value;

  SelectionItem({
    required this.label,
    required this.value,
    this.price,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SelectionItem && other.value == value;
  }

  @override
  int get hashCode => label.hashCode ^ value.hashCode;
}
