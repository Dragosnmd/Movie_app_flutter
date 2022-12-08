import 'dart:async';

import 'package:movie_app/movie/data/movie_dao.dart';
import 'package:movie_app/movie/domain/movie.dart';

import 'mobx.dart';

class FakeMovieDao implements MoviesDao {
  StreamController<List<Movie>> movieStream = StreamController();
  List<Movie> movies = [];
  @override
  Future<void> deleteAllMovies() {
    return asyncValue((_) => {movies = [], movieStream.add(movies)});
  }

  @override
  Future<List<Movie>> getAllMovies() {
    return asyncValue((_) => movies);
    throw UnimplementedError();
  }

  @override
  Future<void> replaceAll(List<Movie> movies) {
      return asyncValue((_) => {movies = [], movieStream.add(movies)});
  }

  @override
  Future<void> upsertMovies(List<Movie> movies) {
    return asyncValue((_) => {movies = [], movieStream.add(movies)});
  }

  @override
  Stream<List<Movie>> watchAllMovies() {
    return movieStream.stream;
  }
}
