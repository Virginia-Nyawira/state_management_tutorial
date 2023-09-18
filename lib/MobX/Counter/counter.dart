
// Pending Implementation
import 'package:mobx/mobx.dart';

// Generated file
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