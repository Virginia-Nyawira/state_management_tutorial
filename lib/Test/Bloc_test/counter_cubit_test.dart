import 'package:flutter/material.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:states/Bloc/Service/counter_cubit.dart';
import 'package:test/test.dart';

void main(){
  group(CounterCubit(), () {
     CounterCubit counterCubit;
     
     setUp(() {
       counterCubit = CounterCubit();
     });

     ///For later!!!!!!!!!!!!!!!
     // tearDown(() {
     //   counterCubit.close();
     // });
     // test(description, () => null)
  } 
  ); //group
}