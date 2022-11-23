import 'package:drift/drift.dart';
import 'package:movie_app/movie/domain/movie_details.dart';

// @UseRowClass(MovieDetails, generateInsertable: true)
class FavoritesMovieTables extends Table {
  IntColumn get id => integer()();
  // TextColumn get title => text()();
  // TextColumn get backdropPath => text()();
  // TextColumn get originalTitle => text()();
  // TextColumn get posterPath => text()();
  // TextColumn get overview => text()();
  // TextColumn get releaseDate => text()();
  // TextColumn get status => text()();
  // IntColumn get ibudget => integer()();
}
