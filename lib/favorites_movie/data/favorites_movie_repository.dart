import 'package:injectable/injectable.dart';
import 'package:movie_app/core/storage/app_database.dart';
import 'package:movie_app/favorites_movie/data/favorites_movie_dao.dart';

import '../../movie/domain/movie_details.dart';

@lazySingleton
class FavoritesMovieRepository {
  final MoviesDao _mDao;
  FavoritesMovieRepository(this._mDao);

  //Add favorite movie
  Future<void> addFavouriteMovie(int id ) async {
    await _mDao.insertFavouriteMovie(id);
  }

  Stream<List<FavoritesMovieTableData>> favoritesMovies() {
    return _mDao.watchAllFavoritesMovies();
  }
}



// import 'package:mobx/mobx.dart';
// import 'package:movie_app/movie/domain/movie.dart';

// part 'favorites_movie_repository.g.dart';

// class FavoritesMovies = _FavoritesMovies with _$FavoritesMovies;

// //The store-class

// abstract class _FavoritesMovies with Store {
//   ObservableList<Movie> favoritesMovies = <Movie>[].asObservable();

//   @action
//   void add(Movie movie) {
//     favoritesMovies.add(movie);
//   }

//   void removeAll() {
//     favoritesMovies.clear();
//   }

//   void remove(Movie movie) {
//     favoritesMovies.remove(movie);
//   }
// }
