import 'package:drift/drift.dart';

import '../../../movie/data/movie_table.dart';
import '../../../movie/domain/movie_details.dart';
export '../../../movie/domain/movie_details.dart';

@UseRowClass(MovieDetails, generateInsertable: true)
class FavoritesMovieTable extends Table {
  IntColumn get id => integer().references(MovieTables, #id)();
  TextColumn get title => text()();
  TextColumn get backdropPath => text()();
  TextColumn get originalTitle => text()();
  TextColumn get posterPath => text()();
  TextColumn get overview => text()();
  TextColumn get releaseDate => text()();
  TextColumn get status => text()();
  IntColumn get budget => integer()();
}
