import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';

///Future Provider Implimentation

class RivFutureProvider extends ConsumerStatefulWidget {
  const RivFutureProvider({super.key});

  @override
  ConsumerState createState() => _RivFutureProviderState();
}

class _RivFutureProviderState extends ConsumerState<RivFutureProvider> {
String userId='1';

  @override
  Widget build(BuildContext context) {
    final userTodo = ref.watch(futureTodoProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ToDo List",style: TextStyle(
          fontWeight: FontWeight.w900,
          wordSpacing: 2,
          letterSpacing: 3,
        ),),
      ),
      body: userTodo.when(data: (data) {
        return Visibility(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Set the number of cards in each row
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: data.todos.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Divider(),
                      Flexible(
                        child: Text(data.todos[index].todo,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      MaterialButton(
                        color: Colors.white12,
                        onPressed: (){},
                        child: Text(
                          data.todos[index].completed == true
                              ? 'Done'
                              : 'Not Done',
                          style: TextStyle(
                            color: data.todos[index].completed == true
                                ? Colors.green
                                : Colors.blueGrey,
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                );
              },
            ),
          );
      }, error: (error, stackTrace) {
        return Center(
          child: Text(error.toString()),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.green,
          ),
        );
      }),
    );
  }
}
