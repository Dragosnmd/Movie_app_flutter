import 'package:movie_app/movies/domain/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_app/movies/data/constants.dart';
part 'popular_movies_response.freezed.dart';
part 'popular_movies_response.g.dart';

@freezed
class PopularMoviesResponse with _$PopularMoviesResponse {
  const PopularMoviesResponse._();

  const factory PopularMoviesResponse({
    required int page,
    @JsonKey(name: 'total_pages') required int totalPages,
    @JsonKey(name: 'total_results') required int totalResults,
    required List<MovieResponse> results,
  }) = _PopularMoviesResponse;

  factory PopularMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesResponseFromJson(json);

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
    @JsonKey(name: 'backdrop_path') required String backdropPath,
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
        backdropPath: backdropPath,
        originalTitle: originalTitle,
        posterPath: '${imageUrl}w500$posterPath');
  }
}
