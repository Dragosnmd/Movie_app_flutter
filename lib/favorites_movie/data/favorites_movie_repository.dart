import 'package:injectable/injectable.dart';
import 'package:movie_app/favorites_movie/data/favorites_movie_dao.dart';

@lazySingleton
  class FavoritesMovieRepository {
  final MoviesDao _mDao;
  FavoritesMovieRepository(this._mDao);


  //Add favorite movie
  Future<void> addFavouriteMovie(int id) async {
    await _mDao.insertFavouriteMovie(id);
  }

  Stream<Set<int>> favoritesMovies() {
    return _mDao.watchAllFavoritesMovies().map((list) => list.map((e) => e.id).toSet());
  }

  Future<void> removeFavoriteMovie(int id) async {
    await _mDao.deleteFavoriteMovie(id);
  }

    Stream<bool> isFavorite(int id) {
    return _mDao.getFavouriteMovieById(id);
  }
}
