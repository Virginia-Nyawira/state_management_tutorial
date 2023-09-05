import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(initialValue: 0));
//Counter Cubit
void increment ()=> emit(CounterState(initialValue: state.initialValue+1));

  void decrement()  {
    emit(CounterState(initialValue: state.initialValue-1));
  }
}
