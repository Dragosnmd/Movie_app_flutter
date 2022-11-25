import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../core/storage/app_database.dart';
import '../../movie/domain/movie_details.dart';

@lazySingleton
class MoviesDao {
  final AppDatabase _db;
  MoviesDao(this._db);

  Stream<List<FavoritesMovieTableData>> watchAllFavoritesMovies() {
    return _db.select(_db.favoritesMovieTable).watch();
  }

//  Insert in favourite movies
  Future<int> insertFavouriteMovie(int id) {
    return _db
        .into(_db.favoritesMovieTable)
        .insert(FavoritesMovieTableData(id:id));
  }

  Future<void> deleteFavoriteMovie( int id) {
    return _db.transaction(() async {
      await _db
          .delete(_db.favoritesMovieTable)
          .delete(FavoritesMovieTableData(id: id));
    });
  }
}
