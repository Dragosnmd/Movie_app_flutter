import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/movies/data/movieGenreResponse/genre_movies_response.dart';
import 'package:movie_app/movies/domain/movie.dart';

import 'package:movie_app/networking/networking.dart';

@lazySingleton
class MoviesApi {
  // final NetworkModule networkModule;
  // MoviesApi(this.networkModule);
  final Dio dio;
  // final NetworkModule networkModule;
  MoviesApi(this.dio);

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }

  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }

  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }

  Future<List<Movie>> getOutInCinema({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }
}
