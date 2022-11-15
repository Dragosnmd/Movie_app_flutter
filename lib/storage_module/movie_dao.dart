import 'package:injectable/injectable.dart';
import 'package:movie_app/movies/domain/movie.dart';
import 'app_database/app_database.dart';
export 'package:movie_app/movies/domain/movie_table.dart';

@injectable
class MoviesDao {
  final AppDatabase _db;
  MoviesDao(this._db);

  Stream<List<Movie>> watchAllMovies() {
    return _db.select(_db.movieTables).watch();
  }

  Future<List<Movie>> getAllMovies() {
    return _db.select(_db.movieTables).get();
  }

  Future<void> replaceAll(final List<Movie> movies) async {
    await deleteAllMovies();
    await upsertMovies(movies);
  }

  Future<void> deleteAllMovies() {
    return _db.transaction(() async {
      await _db.delete(_db.movieTables).go();
    });
  }

  Future<void> upsertMovies(final List<Movie> movies) async {
    // await _db.batch ((batch) {
    //   batch.insertAll(table, rows)
    for (final movie in movies) {
      await _db
          .into(_db.movieTables)
          .insertOnConflictUpdate(movie.toInsertable());
      // }
    }
  }
}