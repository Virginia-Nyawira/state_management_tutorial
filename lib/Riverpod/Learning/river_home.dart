import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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


class RivStateNotifierProvider extends ConsumerStatefulWidget {
  const RivStateNotifierProvider({super.key});

  @override
  ConsumerState createState() => _RivStateNotifierProviderState();
}

class _RivStateNotifierProviderState extends ConsumerState<RivStateNotifierProvider> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  void _onSubmitForm() {
    //Update user details

  }
  void onSubmit(WidgetRef ref, String value) {
    ref.read(jinaProvider.notifier).updateName(value);
  }
  @override
  Widget build(BuildContext context) {
    final jina = ref.watch(jinaProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(jina.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(jina.age.toString()),
          TextField(
            onSubmitted: (value) {
              onSubmit(ref, value);
            },
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    validator: (value){
                      if (value==null) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: _ageController,
                    validator: (value){
                      if (value==null) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Age',
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        _onSubmitForm();
                      },
                      child: const Text('Done'))

                ],
              ))
        ],
      ),
    );
  }
}

///Future Provider Implimentation class

class RivFutureProvider extends StatelessWidget {
  const RivFutureProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
