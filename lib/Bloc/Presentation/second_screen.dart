import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Service/counter_cubit.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, required this.color});
  final Color color;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
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
                BlocConsumer<CounterCubit, CounterState>(
                    listener: (context, state) {
                      // TODO: implement listener}
                      if(state.isIncremented==true){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: const Text("Incremented"),
                              showCloseIcon: true,
                              closeIconColor: Colors.white,
                              duration: const Duration(milliseconds: 1000),
                              backgroundColor: Colors.green[300],
                            )
                        );
                      } else if (state.isIncremented==false){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              showCloseIcon: true,
                              closeIconColor: Colors.white,
                              content: const Text("Decremented"),
                              duration: const Duration(milliseconds: 1000),
                              backgroundColor: Colors.pink[300],
                            )
                        );
                      }
                    },
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
            ),
            MaterialButton(onPressed: (){

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
