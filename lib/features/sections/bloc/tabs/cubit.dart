import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class TabsCubit extends Cubit<TabsStates> {
  TabsCubit() : super(TabsInit());

  static TabsCubit of(context) => BlocProvider.of(context);

  int currentViewIndex = 0;

  void changeView(int index) {
    currentViewIndex = index;
    _emit(TabsInit());
  }

  bool get isStateLoading {
    return state is TabsLoading;
  }

  void _emit(TabsStates state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
