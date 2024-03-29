import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  //ask gpt to explain that line
  CounterCubit() : super(CounterState.initial());

  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrement() {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
