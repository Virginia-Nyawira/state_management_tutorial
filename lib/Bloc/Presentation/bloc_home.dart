import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:states/Bloc/Presentation/internet_cubit.dart';
import 'package:states/Bloc/Presentation/second_screen.dart';
import 'dart:async';

import 'package:states/Bloc/Service/counter_cubit.dart';
import 'package:states/constants.dart';

class BlockHomeView extends StatefulWidget {
  const BlockHomeView({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  _BlockHomeViewState createState() => _BlockHomeViewState();
}

class _BlockHomeViewState extends State<BlockHomeView> {
  //late CounterBloc _counterBloc;

  // @override
  // void initState() {
  //   super.initState();
  //   _counterBloc = Provider.of<CounterBloc>(context, listen: false);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter App',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state){
                  if(state is InternetConnected &&
                  state.connectivityType==ConnectivityType.wifi
                  ){
                    return const Text('Wifi');
                  }else if(
                  state is InternetConnected &&
                      state.connectivityType==ConnectivityType.mobile
                  ){
                    return const Text('Mobile');
                  }
                  else if(
                  state is InternetConnected
                  ){
                    return const Text('Disconnected');
                  }
                  return const CircularProgressIndicator();
                },
            ),
            const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            // StreamBuilder<int>(
            //   stream: _counterBloc.counterStream,
            //   initialData: 0,
            //   builder: (context, snapshot) {
            //     return Text(
            //       '${snapshot.data}',
            //       style: const TextStyle(
            //           fontSize: 24, fontWeight: FontWeight.bold),
            //     );
            //   },
            // ),
            ///       + and - buttons
            // Center(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       FloatingActionButton(
            //         onPressed: () {
            //           BlocProvider.of<CounterCubit>(context).decrement();
            //         },
            //         tooltip: 'Decrement',
            //         heroTag: 'decrementButton',
            //         //Place the bloc builder only at the point where changes are occurring
            //         child: const Icon(Icons.remove),
            //       ),
            //       FloatingActionButton.large(
            //           onPressed: () {
            //             BlocProvider.of<CounterCubit>(context).increment();
            //           },
            //           tooltip: 'Increment',
            //           heroTag: 'incrementButton',
            //           child: const Icon(Icons.add)),
            //     ],
            //   ),
            // ),
            ///**************************************************************************
            const SizedBox(
              height: 10,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 150,
                ),
                BlocConsumer<CounterCubit, CounterState>(
                    listener: (context, state) {
                  // TODO: implement listener}
                  if (state.isIncremented == true) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text("Incremented"),
                      showCloseIcon: true,
                      closeIconColor: Colors.white,
                      duration: const Duration(milliseconds: 1000),
                      backgroundColor: Colors.green[300],
                    ));
                  } else if (state.isIncremented == false) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      showCloseIcon: true,
                      closeIconColor: Colors.white,
                      content: const Text("Decremented"),
                      duration: const Duration(milliseconds: 1000),
                      backgroundColor: Colors.pink[300],
                    ));
                  }
                }, builder: (context, state) {
                  if (state.initialValue < 0) {
                    return Text(
                      "Negative ${state.initialValue}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    );
                  } else if (state.initialValue == 10) {
                    return Text(
                      "Number ${state.initialValue}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    );
                  } else {
                    return Text(
                      "Positive ${state.initialValue}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),
                    );
                  }
                }),
                // BlocBuilder<CounterCubit, CounterState>(
                //   builder: (context, state) {
                //     return Text(state.initialValue.toString());
                //   },
                // ),
              ],
            ),
            MaterialButton(
              color: Colors.pink[400],
              onPressed: () {
                Navigator.of(context).pushNamed('/secondScreen');
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (newContext) => BlocProvider.value(
                //       value: BlocProvider.of<CounterCubit>(context),
                //       //value: CounterCubit(),
                //       child: const SecondScreen(
                //             color: Colors.lime,
                //           ),
                //     )));
              },
              child: const Text("Go to the next page"),
            )
          ],
        ),
      ),
      //bottomNavigationBar: BottomNavigationBar(items: []),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _counterBloc.incrementCounter();
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
