import 'dart:io';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/movies/domain/movie.dart';
import 'package:movie_app/movies/domain/movie_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [MovieTables])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'movie.sqlite'));
    return NativeDatabase(file);
  });
}
