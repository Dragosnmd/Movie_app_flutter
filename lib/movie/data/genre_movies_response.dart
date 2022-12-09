import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/network/network_module.dart';
import '../domain/movie.dart';
part 'genre_movies_response.freezed.dart';
part 'genre_movies_response.g.dart';

@freezed
class GenreMovieListResponse with _$GenreMovieListResponse {
  const GenreMovieListResponse._();

  const factory GenreMovieListResponse({
    required int page,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
    required List<MovieResponse> results,
  }) = _GenreMoviesResponse;

  factory GenreMovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreMovieListResponseFromJson(json);

  List<Movie> toDomainList() {
    return results.map((e) => e.toDomain()).toList();
  }
}

@freezed
class MovieResponse with _$MovieResponse {
  const MovieResponse._();
  const factory MovieResponse({
    required int id,
    required String title,
    required String overview,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'original_title') required String originalTitle,
    @JsonKey(name: 'poster_path') required String posterPath,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  Movie toDomain() {
    return Movie(
        id: id,
        title: title,
        overview: overview,
        backdropPath: '${imageUrl}w500$backdropPath',
        originalTitle: originalTitle,
        posterPath: '${imageUrl}original$posterPath');
  }
}
