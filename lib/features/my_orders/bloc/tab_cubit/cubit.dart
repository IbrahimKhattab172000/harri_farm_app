import 'package:flutter_bloc/flutter_bloc.dart';

part 'states.dart';

class MyOrdersCubit extends Cubit<MyOrdersStates> {
  MyOrdersCubit() : super(MyOrdersInit());

  static MyOrdersCubit of(context) => BlocProvider.of(context);

  int currentViewIndex = 0;

  void changeView(int value) {
    currentViewIndex = value;
    _emit(MyOrdersInit());
  }

  bool get isStateLoading {
    return state is MyOrdersLoading;
  }

  void _emit(MyOrdersStates state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
