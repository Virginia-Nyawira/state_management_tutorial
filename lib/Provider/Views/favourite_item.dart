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
        backgroundColor: Colors.lime,
        centerTitle: true,
        title: Text('My List (${_myList.length})',
          style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        ),
      ),
      body: ListView.builder(
        itemCount: _myList.length,
          itemBuilder: (context, index){
            final currentMovie = _myList[index];
            return Card(
              key: ValueKey(currentMovie.title),
              elevation: 10,
              child: ListTile(
                title: Text(currentMovie.title,
                  style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),),
                subtitle: Text(currentMovie.duration ?? 'No Information',
                  style: const TextStyle(
                  fontSize: 13.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),),
                trailing: TextButton(onPressed: (){
                  context.read<MovieProvider>().removeFromList(currentMovie);
                },
                    child: const Text("Remove", style: TextStyle(
                      fontSize: 12.0,
                      fontStyle: FontStyle.italic,
                    ),),
                ),

              ),
            );
          },
      ),
    );
  }
}

