import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/movie/domain/movie.dart';
import '../../core/network/network_module.dart';
import '../domain/movie_details.dart';
import 'detail_movie_response.dart';
import 'genre_movies_response.dart';

@lazySingleton
@dev
class MoviesApi {
  final Dio _dio;
  MoviesApi(this._dio);

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response =
        await _dio.get('/movie/popular', queryParameters: {'page': page});
    return GenreMovieListResponse.fromJson(response.data).toDomainList();
  }

  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final response =
        await _dio.get('/movie/top_rated', queryParameters: {'page': page});
    return GenreMovieListResponse.fromJson(response.data).toDomainList();
  }

  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    final response =
        await _dio.get('/movie/now_playing', queryParameters: {'page': page});
    return GenreMovieListResponse.fromJson(response.data).toDomainList();
  }

  Future<List<Movie>> getOutInCinema({int page = 1}) async {
    final response =
        await _dio.get('/movie/upcoming', queryParameters: {'page': page});
    return GenreMovieListResponse.fromJson(response.data).toDomainList();
  }

  Future<MovieDetails> getDetails(int movieId) async {
    final response = await _dio.get('/movie/$movieId');
    return DetailMovieResponse.fromJson(response.data).toDomain();
  }
}

final movieApiProvider = Provider((ref) => MoviesApi(ref.watch(dioProvider)));
