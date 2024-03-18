part of 'cubit.dart';

class DropDownSelectionState {
  final List<SelectionItem> selectedItems;

  DropDownSelectionState({
    required this.selectedItems,
  });
}

class DropDownSelectionStateClose extends DropDownSelectionState {
  DropDownSelectionStateClose({
    required super.selectedItems,
  });
}

class DropDownSelectionStateOpen extends DropDownSelectionState {
  DropDownSelectionStateOpen({
    required super.selectedItems,
  });
}
