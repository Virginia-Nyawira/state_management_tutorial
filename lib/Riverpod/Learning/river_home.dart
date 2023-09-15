import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:states/Riverpod/Learning/Model/f_user_model.dart';
import 'package:states/Riverpod/Learning/Model/user_model.dart';
import 'package:states/main.dart';

///Method one -->a class extends ConsumerWidget that contains WidgetRef & the method ref,watch()
///WidgetRef is only used in stateless widgets
///Use when it is necessary to re-build the whole page
///ref.read()--> only when you want to read the value once, --> used outside the build method
///ref.watch --> when you want to keep listening to the changes, -->Used inside build method

class RiverHome extends ConsumerWidget {
  const RiverHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(name),
      ),
      body: Container(
        color: Colors.grey,
      ),
    );
  }
}

///Method Two -->  Consumer widget that returns BuildContext, WidgetRef, child Widget & the method ref,watch()
///Use when it is necessary to re-build a specific Widget

class RiverHomeTwo extends StatelessWidget {
  const RiverHomeTwo({super.key});

  @override
  Widget build(BuildContext context) {
    void onSubmit(WidgetRef ref, String value) {
      ref.read(myName.notifier).update((state) => value);
    }

    return Consumer(builder: (context, ref, child) {
      final title = ref.watch(nameProvider);
      final name = ref.watch(myName) ?? '';

      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(name),
        ),
        body: Container(
          color: Colors.grey,
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              TextField(
                onSubmitted: (value) {
                  onSubmit(ref, value);
                },
              )
            ],
          ),
        ),
      );
    });
  }
}


///Future Provider Implimentation

class RivFutureProvider extends ConsumerStatefulWidget {
  const RivFutureProvider({super.key});

  @override
  ConsumerState createState() => _RivFutureProviderState();
}

class _RivFutureProviderState extends ConsumerState<RivFutureProvider> {
  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    final userTodo = ref.watch(futureTodoProvider);
    return userTodo.when(data: (data) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("ToDos: (${data.total.toString()})",
          style: TextStyle(
            fontWeight: FontWeight.w900
          ),
          ),
        ),
        body: Visibility(
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
                    Text(data.todos[index].todo,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
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
                  ],
                ),
              );
            },
          ),
        ),
      );
    }, error: (error, stackTrace) {
      return Center(
        child: Text(error.toString()),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    });
  }
}
