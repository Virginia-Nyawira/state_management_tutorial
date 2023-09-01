import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/Provider/Model/items_model.dart';

class FavouriteItem extends StatefulWidget {
  const FavouriteItem({super.key});

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  @override
  Widget build(BuildContext context) {
    final _myList= context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My List (${_myList.length})'),
      ),
      body: ListView.builder(
        itemCount: _myList.length,
          itemBuilder: (context, index){
            final currentMovie = _myList[index];
            return Card(
              key: ValueKey(currentMovie.title),
              elevation: 10,
              child: ListTile(
                title: Text(currentMovie.title),
                subtitle: Text(currentMovie.duration ?? 'No Information'),
                trailing: TextButton(onPressed: (){
                  context.read<MovieProvider>().removeFromList(currentMovie);
                },
                    child: const Text("Remove"),
                ),

              ),
            );
          },
      ),
    );
  }
}

