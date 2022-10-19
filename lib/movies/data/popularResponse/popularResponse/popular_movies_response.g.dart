// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PopularMoviesResponse _$$_PopularMoviesResponseFromJson(
        Map<String, dynamic> json) =>
    _$_PopularMoviesResponse(
      page: json['page'] as int,
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PopularMoviesResponseToJson(
        _$_PopularMoviesResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
      'results': instance.results,
    };

_$_MovieResponse _$$_MovieResponseFromJson(Map<String, dynamic> json) =>
    _$_MovieResponse(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      backdropPath: json['backdrop_path'] as String,
      originalTitle: json['original_title'] as String,
      posterPath: json['poster_path'] as String,
    );

Map<String, dynamic> _$$_MovieResponseToJson(_$_MovieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'backdrop_path': instance.backdropPath,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
    };
