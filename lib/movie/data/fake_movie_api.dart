import 'dart:convert';

import 'package:dio/src/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/movie/data/genre_movies_response.dart';
import 'package:movie_app/movie/data/movie_api.dart';
import 'package:movie_app/movie/domain/movie_details.dart';
import 'package:movie_app/movie/domain/movie.dart';

@LazySingleton(as: MoviesApi)
@test
class FakeMovieApi implements MoviesApi {
  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    await Future.delayed(Duration(seconds: 1));
    if (exception != null) {
      throw exception!;
    }
    final response = await rootBundle.loadString('assets/popularMovies.json');
    final data = await json.decode(response);
    return GenreMovieListResponse.fromJson(data).toDomainList();
  }

  Exception? exception;

  @override
  Future<MovieDetails> getDetails(int movieId) {
    // TODO: implement getDetails
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getNowPlayingMovies({int page = 1}) {
    // TODO: implement getNowPlayingMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getOutInCinema({int page = 1}) {
    // TODO: implement getOutInCinema
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTopRatedMovies({int page = 1}) {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }
}
