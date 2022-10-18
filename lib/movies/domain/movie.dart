import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
class Movie with _$Movie {
  factory Movie(
      {required int id,
      required String backdropPath,
      required String originalTitle,
      required String posterPath,
      required String title,
      required String overview}) = _Movie;
}
