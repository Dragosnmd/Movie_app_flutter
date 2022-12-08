import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/movie/data/genre_movies_response.dart';
import 'package:movie_app/movie/data/movie_api.dart';
import 'package:movie_app/movie/data/movie_dao.dart';
import '../../core/storage/app_database.dart';
import '../../favorites_movie/data/favorites_movie_dao.dart';
import '../domain/movie.dart';
import '../domain/movie_details.dart';

@lazySingleton
class MovieRepository {
  final MoviesApi api;
  final MoviesDao _mDao;
  final FavoriteMoviesDao _fDao;
  MovieRepository(this._mDao, this.api, this._fDao);

  Future<void> loadPopularMovies({int page = 1}) async {
    final List<Movie> result = await api.getPopularMovies(page: page);
    await _mDao.replaceAll(result);
  }

  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    return await api.getTopRatedMovies(page: page);
  }

  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    return await api.getNowPlayingMovies(page: page);
  }

  Future<List<Movie>> getOutInCinema({int page = 1}) async {
    return await api.getOutInCinema(page: page);
  }

  Future<MovieDetails> getMovieDetails(int movieId) async {
    return await api.getDetails(movieId);
  }

  Stream<List<Movie>> allPopularMovies() {
    return _mDao.watchAllMovies();
  }

  Stream<List<FavoriteMovie>> allFavoriteMovies() {
    return _fDao.watchAllFavoritesMovies();
  }

// fake data from json
  Future<List<Movie>> readFakePopularMovieJson() async {
    final response = await rootBundle.loadString('assets/popularMovies.json');
    final data = await json.decode(response);
    return GenreMovieListResponse.fromJson(data).toDomainList();
  }
}
