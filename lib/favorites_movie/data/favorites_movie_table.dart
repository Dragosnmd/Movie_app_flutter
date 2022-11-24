import 'package:drift/drift.dart';

import '../../../movie/data/movie_table.dart';
// import '../../../movie/domain/movie_details.dart';
// export '../../../movie/domain/movie_details.dart';

// @UseRowClass(MovieDetails, generateInsertable: true)
class FavoritesMovieTable extends Table {
  IntColumn get id => integer()();
}
