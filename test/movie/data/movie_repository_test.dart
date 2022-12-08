import 'package:movie_app/movie/data/movie_api.dart';
import 'package:movie_app/movie/domain/movie.dart';

class MovieRepositoryTest {
  final MoviesApi api;
  MovieRepositoryTest(this.api);

  Future<void> loadPopularMovies({int page = 1}) async {
    final List<Movie> testresult = await api.getPopularMovies(page: page);
  }
}
