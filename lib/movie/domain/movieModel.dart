import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/movie.dart';
part 'movieModel.freezed.dart';

@freezed
// class MovieModel {
//   final Movie movie;
//   final bool isFavorite;
//   MovieModel(this.movie, this.isFavorite);
// }
class MovieModel with _$MovieModel {
  factory MovieModel( {
    required Movie movie,
    required bool isFavorite,
  }) = _MovieModel;
}
