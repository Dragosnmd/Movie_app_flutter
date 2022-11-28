import 'package:injectable/injectable.dart';
import 'package:movie_app/movie/data/movie_api.dart';
import 'package:movie_app/movie/data/movie_dao.dart';
import '../domain/movie.dart';
import '../domain/movie_details.dart';

@lazySingleton
class MovieRepository {
  final MoviesApi api;
  final MoviesDao _mDao;
  MovieRepository(this._mDao, this.api);

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

  // //Add favorite movie
  // Future<void> addFavouriteMovie(MovieDetails movie) async {
  //   await _mDao.insertFavouriteMovie(movie);

  // }
  // Stream<List<MovieDetails>> favoritesMovies() {
  //   return _mDao.watchAllFavoritesMovies();
  // }

}
