import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:states/Bloc/Presentation/internet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/constants.dart';

part '../Model/counter_state.dart';


class CounterCubit extends Cubit<CounterState> {
  //Imp- How the counter cubit can communicate with the internet cubit
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;
  //late StreamSubscription<InternetState> internetStreamSubscription;

  CounterCubit({required this.internetCubit}) : super(CounterState(initialValue: 0)){
    internetStreamSubscription= internetCubit.stream
        .listen((internetState){
          if(internetState is InternetConnected
              &&
              internetState.connectivityType==ConnectivityType.wifi){
            increment();
          }else if(
          internetState is InternetConnected
              &&
              internetState.connectivityType==ConnectivityType.mobile
          ){
            decrement();
          }
    }
    );
  }
//Counter Cubit
void increment ()=> emit(CounterState(initialValue: state.initialValue+1, isIncremented: true));

  void decrement()  => emit(CounterState(initialValue: state.initialValue-1, isIncremented: false));
  @override
  Future<void> close(){
    internetStreamSubscription.cancel();
    return super.close();
  }
}
