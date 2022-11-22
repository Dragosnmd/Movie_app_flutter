import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_details.freezed.dart';

@freezed
class MovieDetails with _$MovieDetails {
  factory MovieDetails(
      {required int id,
      required String backdropPath,
      required String originalTitle,
      required String posterPath,
      required String title,
      required String overview,
      required String releaseDate,
      required int budget,
      required String status}) = _MovieDetails;
}
