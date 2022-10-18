import 'package:movie_app/movies/data/movie_api.dart';
import 'package:movie_app/movies/domain/movie.dart';

class MovieRepository {
  final MoviesApi api = MoviesApi();

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    return await api.getPopularMovies(page: page);
  }
}
