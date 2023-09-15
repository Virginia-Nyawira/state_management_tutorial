///StateNotifier with StateNotifierProvider

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';
import '../Model/user_model.dart';


class RivStateNotifierProvider extends ConsumerStatefulWidget {
  const RivStateNotifierProvider({super.key});

  @override
  ConsumerState createState() => _RivStateNotifierProviderState();
}

class _RivStateNotifierProviderState
    extends ConsumerState<RivStateNotifierProvider> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  void _onSubmitForm() {
    //Update user details
    if (_formKey.currentState!.validate()) {
      //Update User Values
      ref.read(jinaProvider.notifier).updateUser(RivUser(
        name: _nameController.text,
        age: int.parse(_ageController.text),
      ));

      //Clear text controllers
      _nameController.clear();
      _ageController.clear();
    }
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
      body: ListView(
        shrinkWrap: true,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    controller: _ageController,
                    validator: (value) {
                      if (value!.isEmpty) {
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
                      child: const Text('Done')),
                  const Divider(
                    thickness: 10,
                  ),
                  Text(jina.name),
                  Text(jina.age.toString()),
                ],
              ))
        ],
      ),
    );
  }
}
