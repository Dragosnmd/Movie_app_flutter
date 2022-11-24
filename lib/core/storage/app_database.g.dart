// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MovieTablesCompanion extends UpdateCompanion<Movie> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> backdropPath;
  final Value<String> originalTitle;
  final Value<String> posterPath;
  final Value<String> overview;
  const MovieTablesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.overview = const Value.absent(),
  });
  MovieTablesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String backdropPath,
    required String originalTitle,
    required String posterPath,
    required String overview,
  })  : title = Value(title),
        backdropPath = Value(backdropPath),
        originalTitle = Value(originalTitle),
        posterPath = Value(posterPath),
        overview = Value(overview);
  static Insertable<Movie> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? backdropPath,
    Expression<String>? originalTitle,
    Expression<String>? posterPath,
    Expression<String>? overview,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (originalTitle != null) 'original_title': originalTitle,
      if (posterPath != null) 'poster_path': posterPath,
      if (overview != null) 'overview': overview,
    });
  }

  MovieTablesCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? backdropPath,
      Value<String>? originalTitle,
      Value<String>? posterPath,
      Value<String>? overview}) {
    return MovieTablesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      backdropPath: backdropPath ?? this.backdropPath,
      originalTitle: originalTitle ?? this.originalTitle,
      posterPath: posterPath ?? this.posterPath,
      overview: overview ?? this.overview,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String>(originalTitle.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieTablesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('posterPath: $posterPath, ')
          ..write('overview: $overview')
          ..write(')'))
        .toString();
  }
}

class _$MovieInsertable implements Insertable<Movie> {
  Movie _object;

  _$MovieInsertable(this._object);

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return MovieTablesCompanion(
      id: Value(_object.id),
      backdropPath: Value(_object.backdropPath),
      originalTitle: Value(_object.originalTitle),
      posterPath: Value(_object.posterPath),
      title: Value(_object.title),
      overview: Value(_object.overview),
    ).toColumns(false);
  }
}

extension MovieToInsertable on Movie {
  _$MovieInsertable toInsertable() {
    return _$MovieInsertable(this);
  }
}

class $MovieTablesTable extends MovieTables
    with TableInfo<$MovieTablesTable, Movie> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovieTablesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
      'backdrop_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  @override
  late final GeneratedColumn<String> originalTitle = GeneratedColumn<String>(
      'original_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, backdropPath, originalTitle, posterPath, overview];
  @override
  String get aliasedName => _alias ?? 'movie_tables';
  @override
  String get actualTableName => 'movie_tables';
  @override
  VerificationContext validateIntegrity(Insertable<Movie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    } else if (isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (data.containsKey('original_title')) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableOrUnknown(
              data['original_title']!, _originalTitleMeta));
    } else if (isInserting) {
      context.missing(_originalTitleMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Movie map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Movie(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      backdropPath: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}backdrop_path'])!,
      originalTitle: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}original_title'])!,
      posterPath: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      overview: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
    );
  }

  @override
  $MovieTablesTable createAlias(String alias) {
    return $MovieTablesTable(attachedDatabase, alias);
  }
}

class FavoritesMovieTableCompanion extends UpdateCompanion<MovieDetails> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> backdropPath;
  final Value<String> originalTitle;
  final Value<String> posterPath;
  final Value<String> overview;
  final Value<String> releaseDate;
  final Value<String> status;
  final Value<int> budget;
  const FavoritesMovieTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.backdropPath = const Value.absent(),
    this.originalTitle = const Value.absent(),
    this.posterPath = const Value.absent(),
    this.overview = const Value.absent(),
    this.releaseDate = const Value.absent(),
    this.status = const Value.absent(),
    this.budget = const Value.absent(),
  });
  FavoritesMovieTableCompanion.insert({
    required int id,
    required String title,
    required String backdropPath,
    required String originalTitle,
    required String posterPath,
    required String overview,
    required String releaseDate,
    required String status,
    required int budget,
  })  : id = Value(id),
        title = Value(title),
        backdropPath = Value(backdropPath),
        originalTitle = Value(originalTitle),
        posterPath = Value(posterPath),
        overview = Value(overview),
        releaseDate = Value(releaseDate),
        status = Value(status),
        budget = Value(budget);
  static Insertable<MovieDetails> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? backdropPath,
    Expression<String>? originalTitle,
    Expression<String>? posterPath,
    Expression<String>? overview,
    Expression<String>? releaseDate,
    Expression<String>? status,
    Expression<int>? budget,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (backdropPath != null) 'backdrop_path': backdropPath,
      if (originalTitle != null) 'original_title': originalTitle,
      if (posterPath != null) 'poster_path': posterPath,
      if (overview != null) 'overview': overview,
      if (releaseDate != null) 'release_date': releaseDate,
      if (status != null) 'status': status,
      if (budget != null) 'budget': budget,
    });
  }

  FavoritesMovieTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? backdropPath,
      Value<String>? originalTitle,
      Value<String>? posterPath,
      Value<String>? overview,
      Value<String>? releaseDate,
      Value<String>? status,
      Value<int>? budget}) {
    return FavoritesMovieTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      backdropPath: backdropPath ?? this.backdropPath,
      originalTitle: originalTitle ?? this.originalTitle,
      posterPath: posterPath ?? this.posterPath,
      overview: overview ?? this.overview,
      releaseDate: releaseDate ?? this.releaseDate,
      status: status ?? this.status,
      budget: budget ?? this.budget,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (backdropPath.present) {
      map['backdrop_path'] = Variable<String>(backdropPath.value);
    }
    if (originalTitle.present) {
      map['original_title'] = Variable<String>(originalTitle.value);
    }
    if (posterPath.present) {
      map['poster_path'] = Variable<String>(posterPath.value);
    }
    if (overview.present) {
      map['overview'] = Variable<String>(overview.value);
    }
    if (releaseDate.present) {
      map['release_date'] = Variable<String>(releaseDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (budget.present) {
      map['budget'] = Variable<int>(budget.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesMovieTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('backdropPath: $backdropPath, ')
          ..write('originalTitle: $originalTitle, ')
          ..write('posterPath: $posterPath, ')
          ..write('overview: $overview, ')
          ..write('releaseDate: $releaseDate, ')
          ..write('status: $status, ')
          ..write('budget: $budget')
          ..write(')'))
        .toString();
  }
}

class _$MovieDetailsInsertable implements Insertable<MovieDetails> {
  MovieDetails _object;

  _$MovieDetailsInsertable(this._object);

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    return FavoritesMovieTableCompanion(
      id: Value(_object.id),
      backdropPath: Value(_object.backdropPath),
      originalTitle: Value(_object.originalTitle),
      posterPath: Value(_object.posterPath),
      title: Value(_object.title),
      overview: Value(_object.overview),
      releaseDate: Value(_object.releaseDate),
      budget: Value(_object.budget),
      status: Value(_object.status),
    ).toColumns(false);
  }
}

extension MovieDetailsToInsertable on MovieDetails {
  _$MovieDetailsInsertable toInsertable() {
    return _$MovieDetailsInsertable(this);
  }
}

class $FavoritesMovieTableTable extends FavoritesMovieTable
    with TableInfo<$FavoritesMovieTableTable, MovieDetails> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesMovieTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES movie_tables (id)');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _backdropPathMeta =
      const VerificationMeta('backdropPath');
  @override
  late final GeneratedColumn<String> backdropPath = GeneratedColumn<String>(
      'backdrop_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _originalTitleMeta =
      const VerificationMeta('originalTitle');
  @override
  late final GeneratedColumn<String> originalTitle = GeneratedColumn<String>(
      'original_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _posterPathMeta = const VerificationMeta('posterPath');
  @override
  late final GeneratedColumn<String> posterPath = GeneratedColumn<String>(
      'poster_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _overviewMeta = const VerificationMeta('overview');
  @override
  late final GeneratedColumn<String> overview = GeneratedColumn<String>(
      'overview', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _releaseDateMeta =
      const VerificationMeta('releaseDate');
  @override
  late final GeneratedColumn<String> releaseDate = GeneratedColumn<String>(
      'release_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _budgetMeta = const VerificationMeta('budget');
  @override
  late final GeneratedColumn<int> budget = GeneratedColumn<int>(
      'budget', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        backdropPath,
        originalTitle,
        posterPath,
        overview,
        releaseDate,
        status,
        budget
      ];
  @override
  String get aliasedName => _alias ?? 'favorites_movie_table';
  @override
  String get actualTableName => 'favorites_movie_table';
  @override
  VerificationContext validateIntegrity(Insertable<MovieDetails> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('backdrop_path')) {
      context.handle(
          _backdropPathMeta,
          backdropPath.isAcceptableOrUnknown(
              data['backdrop_path']!, _backdropPathMeta));
    } else if (isInserting) {
      context.missing(_backdropPathMeta);
    }
    if (data.containsKey('original_title')) {
      context.handle(
          _originalTitleMeta,
          originalTitle.isAcceptableOrUnknown(
              data['original_title']!, _originalTitleMeta));
    } else if (isInserting) {
      context.missing(_originalTitleMeta);
    }
    if (data.containsKey('poster_path')) {
      context.handle(
          _posterPathMeta,
          posterPath.isAcceptableOrUnknown(
              data['poster_path']!, _posterPathMeta));
    } else if (isInserting) {
      context.missing(_posterPathMeta);
    }
    if (data.containsKey('overview')) {
      context.handle(_overviewMeta,
          overview.isAcceptableOrUnknown(data['overview']!, _overviewMeta));
    } else if (isInserting) {
      context.missing(_overviewMeta);
    }
    if (data.containsKey('release_date')) {
      context.handle(
          _releaseDateMeta,
          releaseDate.isAcceptableOrUnknown(
              data['release_date']!, _releaseDateMeta));
    } else if (isInserting) {
      context.missing(_releaseDateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('budget')) {
      context.handle(_budgetMeta,
          budget.isAcceptableOrUnknown(data['budget']!, _budgetMeta));
    } else if (isInserting) {
      context.missing(_budgetMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  MovieDetails map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MovieDetails(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      backdropPath: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}backdrop_path'])!,
      originalTitle: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}original_title'])!,
      posterPath: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}poster_path'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      overview: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}overview'])!,
      releaseDate: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}release_date'])!,
      budget: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}budget'])!,
      status: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
    );
  }

  @override
  $FavoritesMovieTableTable createAlias(String alias) {
    return $FavoritesMovieTableTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $MovieTablesTable movieTables = $MovieTablesTable(this);
  late final $FavoritesMovieTableTable favoritesMovieTable =
      $FavoritesMovieTableTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [movieTables, favoritesMovieTable];
}
