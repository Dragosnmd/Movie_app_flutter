// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DetailMovieResponse _$$_DetailMovieResponseFromJson(
        Map<String, dynamic> json) =>
    _$_DetailMovieResponse(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      backdropPath: json['backdrop_path'] as String,
      originalTitle: json['original_title'] as String,
      posterPath: json['poster_path'] as String,
      releaseDate: json['release_date'] as String,
      budget: json['budget'] as int,
      status: json['status'] as String,
    );

Map<String, dynamic> _$$_DetailMovieResponseToJson(
        _$_DetailMovieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'overview': instance.overview,
      'backdrop_path': instance.backdropPath,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'budget': instance.budget,
      'status': instance.status,
    };
