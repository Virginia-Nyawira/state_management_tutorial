import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states/Bloc/Presentation/bloc_home.dart';
import 'package:states/Bloc/Presentation/second_screen.dart';
import 'package:states/Bloc/Service/counter_cubit.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();

  Route? generateThisRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _counterCubit,
                child: const BlockHomeView(color: Colors.white)));

        break;
      case '/secondScreen':
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _counterCubit,
                child: const SecondScreen(color: Colors.white)));
        break;
      default:
        return null;
    }
  }
  @override
  void dispose() {
    _counterCubit.close();
    // TODO: implement dispose
    //super.dispose();
  }
}
