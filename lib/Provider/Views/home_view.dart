import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:states/Provider/Model/items_model.dart';
import 'package:states/Provider/Views/favourite_item.dart';

class ProviderHomeView_Movie extends StatefulWidget {
  const ProviderHomeView_Movie({super.key});

  @override
  State<ProviderHomeView_Movie> createState() => _ProviderHomeView_MovieState();
}

class _ProviderHomeView_MovieState extends State<ProviderHomeView_Movie> {
  @override
  Widget build(BuildContext context) {
    //  For displaying all the movie list
    var movies = context.watch<MovieProvider>().movies;
    //  Responsible for Adding and removing data from the list
    var myList = context.watch<MovieProvider>().myList;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Provider Home',
            style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FavouriteItem()));
              },
              label: Text(
                'Go to my List (${myList.length})',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
              ),
              icon: const Icon(Icons.favorite),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[300],
                  padding: const EdgeInsets.symmetric(vertical: 20)),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final currentMovie = movies[index];
                    return Card(
                      shadowColor: Colors.blue,
                      color: Colors.teal,
                      elevation: 10,
                      key: ValueKey(
                        currentMovie.title,
                      ),
                      child: ListTile(
                          title: Text(
                            currentMovie.title,
                            style: const TextStyle(
                              fontSize: 13.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          subtitle:
                              Text(currentMovie.duration ?? 'No Information',
                                style: const TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),),
                          trailing: IconButton(
                            onPressed: () {
                              if (!myList.contains(currentMovie)) {
                                context
                                    .read<MovieProvider>()
                                    .addToList(currentMovie);
                              } else {
                                context
                                    .read<MovieProvider>()
                                    .removeFromList(currentMovie);
                              }
                            },
                            icon: Icon(
                              Icons.favorite,
                              color: myList.contains(currentMovie)
                                  ? Colors.pink[400]
                                  : Colors.white,
                            ),
                          )),
                    );
                  }),
            ),
          ],
        ));
  }
}
