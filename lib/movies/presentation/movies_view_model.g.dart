// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoviesViewModel on MoviesViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'MoviesViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'MoviesViewModelBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$moviesAtom =
      Atom(name: 'MoviesViewModelBase.movies', context: context);

  @override
  ObservableList<Movie> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<Movie> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$popularMoviesAtom =
      Atom(name: 'MoviesViewModelBase.popularMovies', context: context);

  @override
  Resource<List<Movie>> get popularMovies {
    _$popularMoviesAtom.reportRead();
    return super.popularMovies;
  }

  @override
  set popularMovies(Resource<List<Movie>> value) {
    _$popularMoviesAtom.reportWrite(value, super.popularMovies, () {
      super.popularMovies = value;
    });
  }

  late final _$topRatedMoviesAtom =
      Atom(name: 'MoviesViewModelBase.topRatedMovies', context: context);

  @override
  Resource<List<Movie>> get topRatedMovies {
    _$topRatedMoviesAtom.reportRead();
    return super.topRatedMovies;
  }

  @override
  set topRatedMovies(Resource<List<Movie>> value) {
    _$topRatedMoviesAtom.reportWrite(value, super.topRatedMovies, () {
      super.topRatedMovies = value;
    });
  }

  late final _$nowPlayingMoviesAtom =
      Atom(name: 'MoviesViewModelBase.nowPlayingMovies', context: context);

  @override
  Resource<List<Movie>> get nowPlayingMovies {
    _$nowPlayingMoviesAtom.reportRead();
    return super.nowPlayingMovies;
  }

  @override
  set nowPlayingMovies(Resource<List<Movie>> value) {
    _$nowPlayingMoviesAtom.reportWrite(value, super.nowPlayingMovies, () {
      super.nowPlayingMovies = value;
    });
  }

  late final _$outInCinemaAtom =
      Atom(name: 'MoviesViewModelBase.outInCinema', context: context);

  @override
  Resource<List<Movie>> get outInCinema {
    _$outInCinemaAtom.reportRead();
    return super.outInCinema;
  }

  @override
  set outInCinema(Resource<List<Movie>> value) {
    _$outInCinemaAtom.reportWrite(value, super.outInCinema, () {
      super.outInCinema = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
movies: ${movies},
popularMovies: ${popularMovies},
topRatedMovies: ${topRatedMovies},
nowPlayingMovies: ${nowPlayingMovies},
outInCinema: ${outInCinema}
    ''';
  }
}
