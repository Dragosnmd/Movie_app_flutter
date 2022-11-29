import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/movie/domain/movie.dart';
import '../../core/storage/app_database.dart';

@lazySingleton
class FavoriteMoviesDao {
  final AppDatabase _db;
  FavoriteMoviesDao(this._db);

  Stream<List<FavoriteMovie>> watchAllFavoritesMovies() {
    return _db.select(_db.favoriteMovies).watch();
  }

// Insert into table
  Future<int> insertFavouriteMovie(int id) {
    return _db.into(_db.favoriteMovies).insert(FavoriteMovie(id: id));
  }

// Delete Id from table
  Future<void> deleteFavoriteMovie(int id) {
    return (_db.delete(_db.favoriteMovies)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  Stream<bool> getFavouriteMovieById(int id) {
    return (_db.select(_db.favoriteMovies)..where((tbl) => tbl.id.equals(id)))
        .watchSingleOrNull()
        .map((event) => event != null);
  }

  Future<List<FavoriteMovie>> getAllFavoriteMovies() {
    final query = _db.select(_db.favoriteMovies).join([
      innerJoin(_db.movieTables,
          _db.movieTables.title.equalsExp(_db.favoriteMovies.title))
    ]);
    return _db.select(_db.favoriteMovies).get();
  }
}
