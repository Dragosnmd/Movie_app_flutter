import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/movies/data/movie_mocked.dart';

class FavoritesModel extends ChangeNotifier {
  /// Internal, private state of the list
  final List<MovieMocked> _favoritesMovies = [];

  UnmodifiableListView<MovieMocked> get favoritesMovies =>
      UnmodifiableListView(_favoritesMovies);

  void add(MovieMocked movie) {
    _favoritesMovies.add(movie);
    notifyListeners();
  }

  void removeAll() {
    _favoritesMovies.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void remove(MovieMocked movie) {
    _favoritesMovies.remove(movie);
    notifyListeners();
  }
}
