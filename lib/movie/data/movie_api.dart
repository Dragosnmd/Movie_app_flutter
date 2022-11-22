import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/movie/domain/movie.dart';
import '../domain/movie_details.dart';
import 'detail_movie_response.dart';
import 'genre_movies_response.dart';



@lazySingleton
class MoviesApi {
  final Dio dio;

  MoviesApi(this.dio);

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    return GenreMovieListResponse.fromJson(response.data).toDomainList();
  }

  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return GenreMovieListResponse.fromJson(response.data).toDomainList();
  }

  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    return GenreMovieListResponse.fromJson(response.data).toDomainList();
  }

  Future<List<Movie>> getOutInCinema({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return GenreMovieListResponse.fromJson(response.data).toDomainList();
  }

  Future<MovieDetails> getDetails(int movieId) async {
    final respone = await dio.get('/movie/$movieId');
    return DetailMovieResponse.fromJson(respone.data).toDomain();
  }
}
