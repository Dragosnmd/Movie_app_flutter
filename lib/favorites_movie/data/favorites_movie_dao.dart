import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/movie/domain/movie.dart';
import '../../core/storage/app_database.dart';
import '../../core/storage/storage_module.dart';

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

  Stream<List<Movie>> getAllFavoriteMovies() {
    final query = _db.select(_db.favoriteMovies).join([
      innerJoin(
          _db.movieTables, _db.movieTables.id.equalsExp(_db.favoriteMovies.id))
    ]).map((row) => row.readTable(_db.movieTables));

    return query.watch();
  }
}

final favoriteMovieDaoProvider = Provider((ref) => FavoriteMoviesDao((ref.watch(appDatabaseProvider))));
