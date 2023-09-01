import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/Provider/Model/items_model.dart';

class ProviderHomeView extends StatefulWidget {
  const ProviderHomeView({super.key});

  @override
  State<ProviderHomeView> createState() => _ProviderHomeViewState();
}

class _ProviderHomeViewState extends State<ProviderHomeView> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    return Scaffold(
appBar: AppBar(
  centerTitle: true,
  title: const Text('Provider Home'),
),
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index){
            final currentMovie= movies[index];
            return Card(
              color: Colors.teal,
              elevation: 10,
              key: ValueKey(currentMovie.title),
              child: ListTile(
                title: Text(currentMovie.title),
                subtitle: Text(currentMovie.duration ?? 'No Information'),
              ),
            );

      })
    );
  }
}
