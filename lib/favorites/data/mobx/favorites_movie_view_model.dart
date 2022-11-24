

import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/movie/domain/movie.dart';

class FavoritesMovieViewModel extends ChangeNotifier {
  /// Internal, private state of the list
  // final List<MovieMocked> _favoritesMovies = [];
    final List<Movie> _favoritesMovies = [];

  UnmodifiableListView<Movie> get favoritesMovies =>
      UnmodifiableListView(_favoritesMovies);

  void add(Movie movie) {
    _favoritesMovies.add(movie);
    notifyListeners();
  }

  void removeAll() {
    _favoritesMovies.clear();
  
    notifyListeners();
  }

  void remove(Movie movie) {
    _favoritesMovies.remove(movie);
    notifyListeners();
  }
}

