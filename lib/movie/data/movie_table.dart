import 'package:drift/drift.dart';
import '../domain/movie.dart';

@UseRowClass(Movie, generateInsertable: true)
class MovieTables extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get backdropPath => text()();
  TextColumn get originalTitle => text()();
  TextColumn get posterPath => text()();
  TextColumn get overview => text()();
}
