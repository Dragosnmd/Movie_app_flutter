import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:movie_app/movie/domain/movie_details.dart';

class FavoritesModel extends ChangeNotifier {
  /// Internal, private state of the list
  /// 
  final List<MovieDetails> _favoritesMovies = [];

  UnmodifiableListView<MovieDetails> get favoritesMovies =>
      UnmodifiableListView(_favoritesMovies);

  void add(MovieDetails movie) {
    _favoritesMovies.add(movie);
    notifyListeners();
  }

  void removeAll() {
    _favoritesMovies.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void remove(MovieDetails movie) {
    _favoritesMovies.remove(movie);
    notifyListeners();
  }
}
