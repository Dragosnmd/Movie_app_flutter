import 'package:injectable/injectable.dart';
import 'package:movie_app/favorites_movie/data/favorite_movie.dart';
import 'package:movie_app/favorites_movie/data/favorites_movie_dao.dart';

@lazySingleton
  class FavoritesMovieRepository {
  final FavoriteMoviesDao _fDao;
  FavoritesMovieRepository(this._fDao);


  //Add favorite movie
  Future<void> addFavouriteMovie(int id) async {
    await _fDao.insertFavouriteMovie(id);
  }

  Stream<Set<int>> favoritesMovies() {
    return _fDao.watchAllFavoritesMovies().map((list) => list.map((e) => e.id).toSet());
  }

  Future<void> removeFavoriteMovie(int id) async {
    await _fDao.deleteFavoriteMovie(id);
  }

    Stream<bool> isFavorite(int id) {
    return _fDao.getFavouriteMovieById(id);
  }
}
