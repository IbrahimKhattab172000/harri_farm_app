// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cubit.dart';

class ExpanedDownState {
  final bool isSelected;
  ExpanedDownState({
    required this.isSelected,
  });

  ExpanedDownState copyWith({
    bool? isSelected,
  }) {
    return ExpanedDownState(
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
