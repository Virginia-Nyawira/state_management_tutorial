import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class CounterBloc {
  int _counter = 0;
  final _counterStreamController = StreamController<int>();

  Stream<int> get counterStream => _counterStreamController.stream;

  void incrementCounter() {
    _counter++;
    _counterStreamController.sink.add(_counter);
  }

  void dispose() {
    _counterStreamController.close();
  }
}
class BlockHomeView extends StatefulWidget {
  const BlockHomeView({required Key key}) : super(key: key);

  @override
  _BlockHomeViewState createState() => _BlockHomeViewState();
}

class _BlockHomeViewState extends State<BlockHomeView> {
  late CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();
    _counterBloc = Provider.of<CounterBloc>(context, listen: false);
  }

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
            StreamBuilder<int>(
              stream: _counterBloc.counterStream,
              initialData: 0,
              builder: (context, snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counterBloc.incrementCounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
