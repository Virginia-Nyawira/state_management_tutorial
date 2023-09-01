import 'dart:math';

import 'package:flutter/material.dart';

class Movie{
  final String title;
  final String? duration;

  Movie({required this.title, this.duration});
}

//Generating 50 movies using the movies Model
final List<Movie> initialData =
List.generate(50, (index) => Movie
  (title: "Movie $index",
duration: "${Random().nextInt(100)+ 60} minutes"
)
);

class MovieProvider with ChangeNotifier {
  final List<Movie> _movies= initialData;
  List<Movie> get movies => _movies;

}