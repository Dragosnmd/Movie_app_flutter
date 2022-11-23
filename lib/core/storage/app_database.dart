import 'dart:io';
import 'package:drift/native.dart';
import 'package:movie_app/favorites/data/favorites_movie_table.dart';
import 'package:movie_app/movie/domain/movie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import '../../movie/data/movie_table.dart';
import '../../movie/domain/movie_details.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [MovieTables, FavoritesMovieTables])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'movie.sqlite'));
    return NativeDatabase(file);
  });
}
