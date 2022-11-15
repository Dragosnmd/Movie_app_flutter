import 'package:injectable/injectable.dart';
import 'package:movie_app/movies/data/movieGenreResponse/genre_movies_response.dart';
import 'package:movie_app/movies/domain/movie.dart';

import 'package:movie_app/networking/networking.dart';

@singleton
class MoviesApi {
  // final NetworkModule networkModule;
  // MoviesApi(this.networkModule);
  final NetworkModule networkModule;
  MoviesApi(this.networkModule);

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response = await networkModule.dio
        .get('/movie/popular', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }

  Future<List<Movie>> getTopRatedMovies({int page = 1}) async {
    final response = await networkModule.dio
        .get('/movie/top_rated', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }

  Future<List<Movie>> getNowPlayingMovies({int page = 1}) async {
    final response = await networkModule.dio
        .get('/movie/now_playing', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }

  Future<List<Movie>> getOutInCinema({int page = 1}) async {
    final response = await networkModule.dio
        .get('/movie/upcoming', queryParameters: {'page': page});
    return GenreMovieResponse.fromJson(response.data).toDomainList();
  }
}
