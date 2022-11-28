import 'dart:io';
import 'package:drift/native.dart';
import 'package:movie_app/movie/domain/movie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import '../../favorites_movie/data/favorites_movie_table.dart';
import '../../movie/data/movie_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [MovieTables, FavoriteMovies])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // @override
  // MigrationStrategy get migration {
  //   return MigrationStrategy(beforeOpen: (details) async {
  //     await customStatement('PRAGMA foreign_keys = ON');
  //   });
  // }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'movie.sqlite'));
    return NativeDatabase(file);
  });
}
