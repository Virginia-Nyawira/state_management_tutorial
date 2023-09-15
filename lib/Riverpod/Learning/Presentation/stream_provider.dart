import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:states/main.dart';

///Riverpod StreamProvider

class RiverPodStream extends ConsumerWidget {
  const RiverPodStream({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(streamProvider).when(data: (data) {
      return  Material(
          child: Center(child: Text(data.toString())),
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
