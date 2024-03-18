import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harri_farm_app/features/product_details/models/selection.dart';

part 'state.dart';

class DropDownSelectionCubit extends Cubit<DropDownSelectionState> {
  List<SelectionItem>? initialItems;
  final bool multiSelection;
  Function(List<SelectionItem> values)? onChangeValues;
  Function(SelectionItem? value)? onChangeValue;
  SelectionItem? initialItem;

  DropDownSelectionCubit.single({
    required this.initialItem,
    required this.onChangeValue,
    this.multiSelection = false,
  }) : super(DropDownSelectionStateClose(
          selectedItems: initialItem != null ? [initialItem] : [],
        ));

  DropDownSelectionCubit.multi({
    required this.initialItems,
    required this.onChangeValues,
    this.multiSelection = true,
  }) : super(DropDownSelectionStateClose(
          selectedItems: initialItems!,
        ));

// Adds new item to selected items & triggers new emit
  _add({required SelectionItem item}) {
    if (state is DropDownSelectionStateOpen) {
      final List<SelectionItem> newItems = [];
      if (multiSelection) {
        // Get selected items
        newItems.addAll(state.selectedItems);
        // Add item
        newItems.add(item);
        // Call individiual onChange function
        onChangeValues!(newItems);
        // Emit new state with updated items
        _emitDropDownSelectionStateOpen(selectedItems: newItems);
      } else {
        // Add item
        newItems.add(item);
        // Call individiual onChange function
        onChangeValue!(item);
        // Emit new state with updated items
        _emitDropDownSelectionStateClose(selectedItems: newItems);
      }
    }
  }

// removes item from selected items & triggers new emit
  _remove({required SelectionItem item}) {
    // Get selected items
    final List<SelectionItem> newItems = state.selectedItems;
    // Remove item
    newItems.remove(item);
    // Emit new state with updated items
    if (state is DropDownSelectionStateOpen) {
      _emitDropDownSelectionStateOpen(selectedItems: newItems);
    } else {
      _emitDropDownSelectionStateClose(selectedItems: newItems);
    }
    // Call individiual onChange function
    if (multiSelection) {
      onChangeValues!(newItems);
    } else {
      onChangeValue!(null);
    }
  }

// Open the selection section
  openSelection() {
    if (state is DropDownSelectionStateClose) {
      _emitDropDownSelectionStateOpen();
    }
  }

// Close the selection section
  closeSelection() {
    if (state is DropDownSelectionStateOpen) {
      _emitDropDownSelectionStateClose();
    }
  }

// Emit new State to open selection section
// Optional param to set new selected items, as default it takes the selected items from last state
  _emitDropDownSelectionStateOpen({
    List<SelectionItem>? selectedItems,
  }) {
    emit(DropDownSelectionStateOpen(
      selectedItems: selectedItems ?? state.selectedItems,
    ));
  }

// Emit new State to close selection section
// Optional param to set new selected items, as default it takes the selected items from last state
  _emitDropDownSelectionStateClose({
    List<SelectionItem>? selectedItems,
  }) {
    emit(DropDownSelectionStateClose(
      selectedItems: selectedItems ?? state.selectedItems,
    ));
  }

// On item pressed
  tap({required SelectionItem item}) {
    // Check if item is already selected
    if (state.selectedItems.contains(item)) {
      _remove(item: item);
    } else {
      _add(item: item);
    }
  }
}
