import 'package:movie_app/movies/data/movie_api.dart';
import 'package:movie_app/movies/domain/movie.dart';

class MovieRepository {
  final MoviesApi api = MoviesApi();

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    return await api.getPopularMovies(page: page);
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
}
