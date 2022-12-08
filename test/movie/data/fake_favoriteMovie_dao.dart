import 'dart:async';
import 'package:movie_app/core/storage/app_database.dart';
import 'package:movie_app/favorites_movie/data/favorites_movie_dao.dart';
import 'package:movie_app/movie/domain/movie.dart';

class FakeFavoriteMovieDao implements FavoriteMoviesDao {
  StreamController<List<FavoriteMovie>> favoriteMovieStream =
      StreamController();

  @override
  Future<void> deleteFavoriteMovie(int id) {
    // TODO: implement deleteFavoriteMovie
    throw UnimplementedError();
  }

  @override
  Stream<List<Movie>> getAllFavoriteMovies() {
    // TODO: implement getAllFavoriteMovies
    throw UnimplementedError();
  }

  @override
  Stream<bool> getFavouriteMovieById(int id) {
    // TODO: implement getFavouriteMovieById
    throw UnimplementedError();
  }

  @override
  Future<int> insertFavouriteMovie(int id) {
    // TODO: implement insertFavouriteMovie
    throw UnimplementedError();
  }

  @override
  Stream<List<FavoriteMovie>> watchAllFavoritesMovies() {
    favoriteMovieStream.add([]);
    return favoriteMovieStream.stream;
  }
}
