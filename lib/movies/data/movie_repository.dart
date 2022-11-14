import 'package:movie_app/movies/data/movie_api.dart';
import 'package:movie_app/movies/domain/movie.dart';
import 'package:movie_app/storage_module/movie_dao.dart';

class MovieRepository {
  final MoviesApi api;
  final MoviesDao _mDao;
  MovieRepository(this._mDao, this.api);

  Future<void> loadMovies({int page = 1}) async {
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

  Stream<List<Movie>> allMovies() {
    return _mDao.watchAllMovies();
  }
}
