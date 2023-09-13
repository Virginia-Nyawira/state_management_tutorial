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
final name= ref.watch(nameProvider);
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

    return Consumer(
      builder: (context,ref, child) {
        final title = ref.watch(nameProvider);
        final name= ref.watch(myName)?? '';
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
    );
  }
}
