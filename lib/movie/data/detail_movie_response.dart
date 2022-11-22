import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/network/network_module.dart';
import '../domain/movie_details.dart';
part 'detail_movie_response.freezed.dart';
part 'detail_movie_response.g.dart';

@freezed
class DetailMovieResponse with _$DetailMovieResponse {
  const DetailMovieResponse._();
  const factory DetailMovieResponse(
      {required int id,
      required String title,
      required String overview,
      @JsonKey(name: 'backdrop_path') required String backdropPath,
      @JsonKey(name: 'original_title') required String originalTitle,
      @JsonKey(name: 'poster_path') required String posterPath,
      @JsonKey(name: 'release_date') required String releaseDate,
      required int budget,
      required String status}) = _DetailMovieResponse;

  factory DetailMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailMovieResponseFromJson(json);

  MovieDetails toDomain() {
    return MovieDetails(
        id: id,
        title: title,
        overview: overview,
        releaseDate: releaseDate,
        budget: budget,
        status: status,
        backdropPath: '${imageUrl}w500/$backdropPath',
        originalTitle: originalTitle,
        posterPath: '${imageUrl}original/$posterPath');
  }
}
