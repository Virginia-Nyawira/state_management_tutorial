import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:states/Bloc/counter_cubit.dart';

// class CounterBloc {
//   int _counter = 0;
//   final _counterStreamController = StreamController<int>();
//
//   Stream<int> get counterStream => _counterStreamController.stream;
//
//   void incrementCounter() {
//     _counter++;
//     _counterStreamController.sink.add(_counter);
//   }
//
//   void dispose() {
//     _counterStreamController.close();
//   }
// }

class BlockHomeView extends StatefulWidget {
  const BlockHomeView({Key? key}) : super(key: key);

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
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          // TODO: implement listener}
          if(state.isIncremented==true){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Incremented"))
            );
          } else if (state.isIncremented==false){
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Decremented"))
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      tooltip: 'Decrement',
                      //Place the bloc builder only at the point where changes are occurring
                      child: const Icon(Icons.remove),
                    ),
                    FloatingActionButton.large(
                        onPressed: () {
                          BlocProvider.of<CounterCubit>(context).increment();
                        },
                        tooltip: 'Increment',
                        child: const Icon(Icons.add)
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 150,
                  ),
                  BlocBuilder<CounterCubit, CounterState>(
                      builder: (context, state) {
                        if (state.initialValue < 0) {
                          return Text("Negative ${state.initialValue}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 16,
                            ),);
                        } else if (state.initialValue == 10) {
                          return Text("Number ${state.initialValue}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 16,
                            ),);
                        } else {
                          return Text("Positive ${state.initialValue}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 16,
                            ),);
                        }
                      }
                  ),
                  // BlocBuilder<CounterCubit, CounterState>(
                  //   builder: (context, state) {
                  //     return Text(state.initialValue.toString());
                  //   },
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _counterBloc.incrementCounter();
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
