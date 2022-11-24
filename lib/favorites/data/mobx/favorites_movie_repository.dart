import 'package:mobx/mobx.dart';
import 'package:movie_app/movie/domain/movie.dart';

part 'favorites_movie_repository.g.dart';

class FavoritesMovies = _FavoritesMovies with _$FavoritesMovies;

//The store-class

abstract class _FavoritesMovies with Store {
  ObservableList<Movie> favoritesMovies = <Movie>[].asObservable();

  @action
  void add(Movie movie) {
    favoritesMovies.add(movie);
  }

  void removeAll() {
    favoritesMovies.clear();
  }

  void remove(Movie movie) {
    favoritesMovies.remove(movie);
  }
}
