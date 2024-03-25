import 'package:flutter_bloc/flutter_bloc.dart';
part 'state.dart';

class ExpandDownCubit extends Cubit<ExpanedDownState> {
  ExpandDownCubit() : super(ExpanedDownState(isSelected: false));

  void update() {
    emit(state.copyWith(isSelected: !state.isSelected));
  }
}
