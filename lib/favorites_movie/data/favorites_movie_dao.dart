import 'package:injectable/injectable.dart';
import '../../core/storage/app_database.dart';


@lazySingleton
class MoviesDao {
  final AppDatabase _db;
  MoviesDao(this._db);

  Stream<List<FavoriteMovie>> watchAllFavoritesMovies() {
    return _db.select(_db.favoriteMovies).watch();
  }

// Insert into table
  Future<int> insertFavouriteMovie(int id) {
    return _db
        .into(_db.favoriteMovies)
        .insert(FavoriteMovie(id:id));
  }

// Delete Id from table
  Future<void> deleteFavoriteMovie( int id) {
    return (_db.delete(_db.favoriteMovies)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Stream<bool> getFavouriteMovieById(int id) {
    return (_db.select(_db.favoriteMovies)
          ..where((tbl) => tbl.id.equals(id)))
        .watchSingleOrNull()
        .map((event) => event != null);
  }

}
