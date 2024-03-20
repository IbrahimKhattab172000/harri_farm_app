import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class PaymentSelectionCubit extends Cubit<PaymentSelectionState> {
  PaymentSelectionCubit() : super(PaymentSelectionInitial()) {
    _initial();
  }

  static PaymentSelectionCubit of(context) => BlocProvider.of(context);

  bool payInCash = true;

  _initial() {
    emit(PaymentSelectionCash());
  }

  toggleStates({required bool isCash}) {
    isCash ? emit(PaymentSelectionCash()) : emit(PaymentSelectionCredit());
    payInCash = isCash;
  }
}
