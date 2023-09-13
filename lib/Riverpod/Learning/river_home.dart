import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:states/main.dart';

///Method one --> Consumer Widget that contains WidgetRef & the method ref,watch()
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
