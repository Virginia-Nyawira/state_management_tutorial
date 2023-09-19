
// Pending Implementation. Will comme back some other time later
import 'package:mobx/mobx.dart';

// Generated file -- flutter pub run build_runner build
// part 'counter.g.dart';
//
// class Counter = _Counter with _$Counter;

class _Counter with Store{
  @observable
  int value = 0;

  @action
  void increment(){
    value++;
  }

}