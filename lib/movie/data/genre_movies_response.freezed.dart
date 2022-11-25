// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'genre_movies_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenreMovieListResponse _$GenreMovieListResponseFromJson(
    Map<String, dynamic> json) {
  return _GenreMoviesResponse.fromJson(json);
}

/// @nodoc
mixin _$GenreMovieListResponse {
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_results')
  int get totalResults => throw _privateConstructorUsedError;
  List<MovieResponse> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreMovieListResponseCopyWith<GenreMovieListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreMovieListResponseCopyWith<$Res> {
  factory $GenreMovieListResponseCopyWith(GenreMovieListResponse value,
          $Res Function(GenreMovieListResponse) then) =
      _$GenreMovieListResponseCopyWithImpl<$Res, GenreMovieListResponse>;
  @useResult
  $Res call(
      {int page,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'total_results') int totalResults,
      List<MovieResponse> results});
}

/// @nodoc
class _$GenreMovieListResponseCopyWithImpl<$Res,
        $Val extends GenreMovieListResponse>
    implements $GenreMovieListResponseCopyWith<$Res> {
  _$GenreMovieListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalPages = null,
    Object? totalResults = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieResponse>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenreMoviesResponseCopyWith<$Res>
    implements $GenreMovieListResponseCopyWith<$Res> {
  factory _$$_GenreMoviesResponseCopyWith(_$_GenreMoviesResponse value,
          $Res Function(_$_GenreMoviesResponse) then) =
      __$$_GenreMoviesResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      @JsonKey(name: 'total_pages') int totalPages,
      @JsonKey(name: 'total_results') int totalResults,
      List<MovieResponse> results});
}

/// @nodoc
class __$$_GenreMoviesResponseCopyWithImpl<$Res>
    extends _$GenreMovieListResponseCopyWithImpl<$Res, _$_GenreMoviesResponse>
    implements _$$_GenreMoviesResponseCopyWith<$Res> {
  __$$_GenreMoviesResponseCopyWithImpl(_$_GenreMoviesResponse _value,
      $Res Function(_$_GenreMoviesResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? totalPages = null,
    Object? totalResults = null,
    Object? results = null,
  }) {
    return _then(_$_GenreMoviesResponse(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      totalResults: null == totalResults
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieResponse>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenreMoviesResponse extends _GenreMoviesResponse {
  const _$_GenreMoviesResponse(
      {required this.page,
      @JsonKey(name: 'total_pages') required this.totalPages,
      @JsonKey(name: 'total_results') required this.totalResults,
      required final List<MovieResponse> results})
      : _results = results,
        super._();

  factory _$_GenreMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GenreMoviesResponseFromJson(json);

  @override
  final int page;
  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @override
  @JsonKey(name: 'total_results')
  final int totalResults;
  final List<MovieResponse> _results;
  @override
  List<MovieResponse> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'GenreMovieListResponse(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenreMoviesResponse &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.totalResults, totalResults) ||
                other.totalResults == totalResults) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, totalPages, totalResults,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenreMoviesResponseCopyWith<_$_GenreMoviesResponse> get copyWith =>
      __$$_GenreMoviesResponseCopyWithImpl<_$_GenreMoviesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenreMoviesResponseToJson(
      this,
    );
  }
}

abstract class _GenreMoviesResponse extends GenreMovieListResponse {
  const factory _GenreMoviesResponse(
      {required final int page,
      @JsonKey(name: 'total_pages') required final int totalPages,
      @JsonKey(name: 'total_results') required final int totalResults,
      required final List<MovieResponse> results}) = _$_GenreMoviesResponse;
  const _GenreMoviesResponse._() : super._();

  factory _GenreMoviesResponse.fromJson(Map<String, dynamic> json) =
      _$_GenreMoviesResponse.fromJson;

  @override
  int get page;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @override
  @JsonKey(name: 'total_results')
  int get totalResults;
  @override
  List<MovieResponse> get results;
  @override
  @JsonKey(ignore: true)
  _$$_GenreMoviesResponseCopyWith<_$_GenreMoviesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) {
  return _MovieResponse.fromJson(json);
}

/// @nodoc
mixin _$MovieResponse {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_title')
  String get originalTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_path')
  String get posterPath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieResponseCopyWith<MovieResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieResponseCopyWith<$Res> {
  factory $MovieResponseCopyWith(
          MovieResponse value, $Res Function(MovieResponse) then) =
      _$MovieResponseCopyWithImpl<$Res, MovieResponse>;
  @useResult
  $Res call(
      {int id,
      String title,
      String overview,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'original_title') String originalTitle,
      @JsonKey(name: 'poster_path') String posterPath});
}

/// @nodoc
class _$MovieResponseCopyWithImpl<$Res, $Val extends MovieResponse>
    implements $MovieResponseCopyWith<$Res> {
  _$MovieResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overview = null,
    Object? backdropPath = freezed,
    Object? originalTitle = null,
    Object? posterPath = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovieResponseCopyWith<$Res>
    implements $MovieResponseCopyWith<$Res> {
  factory _$$_MovieResponseCopyWith(
          _$_MovieResponse value, $Res Function(_$_MovieResponse) then) =
      __$$_MovieResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String overview,
      @JsonKey(name: 'backdrop_path') String? backdropPath,
      @JsonKey(name: 'original_title') String originalTitle,
      @JsonKey(name: 'poster_path') String posterPath});
}

/// @nodoc
class __$$_MovieResponseCopyWithImpl<$Res>
    extends _$MovieResponseCopyWithImpl<$Res, _$_MovieResponse>
    implements _$$_MovieResponseCopyWith<$Res> {
  __$$_MovieResponseCopyWithImpl(
      _$_MovieResponse _value, $Res Function(_$_MovieResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? overview = null,
    Object? backdropPath = freezed,
    Object? originalTitle = null,
    Object? posterPath = null,
  }) {
    return _then(_$_MovieResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      originalTitle: null == originalTitle
          ? _value.originalTitle
          : originalTitle // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: null == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovieResponse extends _MovieResponse {
  const _$_MovieResponse(
      {required this.id,
      required this.title,
      required this.overview,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'original_title') required this.originalTitle,
      @JsonKey(name: 'poster_path') required this.posterPath})
      : super._();

  factory _$_MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$$_MovieResponseFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String overview;
  @override
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @override
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @override
  @JsonKey(name: 'poster_path')
  final String posterPath;

  @override
  String toString() {
    return 'MovieResponse(id: $id, title: $title, overview: $overview, backdropPath: $backdropPath, originalTitle: $originalTitle, posterPath: $posterPath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.originalTitle, originalTitle) ||
                other.originalTitle == originalTitle) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, overview,
      backdropPath, originalTitle, posterPath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieResponseCopyWith<_$_MovieResponse> get copyWith =>
      __$$_MovieResponseCopyWithImpl<_$_MovieResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieResponseToJson(
      this,
    );
  }
}

abstract class _MovieResponse extends MovieResponse {
  const factory _MovieResponse(
          {required final int id,
          required final String title,
          required final String overview,
          @JsonKey(name: 'backdrop_path') final String? backdropPath,
          @JsonKey(name: 'original_title') required final String originalTitle,
          @JsonKey(name: 'poster_path') required final String posterPath}) =
      _$_MovieResponse;
  const _MovieResponse._() : super._();

  factory _MovieResponse.fromJson(Map<String, dynamic> json) =
      _$_MovieResponse.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get overview;
  @override
  @JsonKey(name: 'backdrop_path')
  String? get backdropPath;
  @override
  @JsonKey(name: 'original_title')
  String get originalTitle;
  @override
  @JsonKey(name: 'poster_path')
  String get posterPath;
  @override
  @JsonKey(ignore: true)
  _$$_MovieResponseCopyWith<_$_MovieResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
