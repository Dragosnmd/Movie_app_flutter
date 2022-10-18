import 'package:mobx/mobx.dart';

import '../../../data/models/movie_mocked.dart';

part 'favorites_movie_store.g.dart';

class FavoritesMovies = _FavoritesMovies with _$FavoritesMovies;

//The store-class

abstract class _FavoritesMovies with Store {
  ObservableList<MovieMocked> favoritesMovies = <MovieMocked>[].asObservable();

  @action
  void add(MovieMocked movie) {
    favoritesMovies.add(movie);
  }

  void removeAll() {
    favoritesMovies.clear();
  }

  void remove(MovieMocked movie) {
    favoritesMovies.remove(movie);
  }
}
