import 'package:drift/drift.dart';
import 'package:movie_app/movies/domain/movie.dart';
import 'package:movie_app/storage_module/storage_module.dart';
import 'app_database/app_database.dart';

@DriftAccessor(tables: [MovieTables])
class MoviesDao {
  final AppDatabase _db = StorageModule.getInstance().database;


  Stream<List<Movie>> watchAllMovies() {
    return _db.select(_db.movieTables).watch();
  }
  //Todo crud operatuins
}
