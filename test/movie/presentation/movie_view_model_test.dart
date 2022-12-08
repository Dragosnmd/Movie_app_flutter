import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/auth/data/login_repository.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/favorites_movie/data/favorites_movie_repository.dart';
import 'package:movie_app/movie/data/movie_repository.dart';
import 'package:movie_app/movie/presentation/movies_view_model.dart';

import '../data/fake_favoriteMovie_dao.dart';
import '../data/fake_movie_api.dart';
import '../data/fake_movie_dao.dart';
import '../data/mobx.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Future<void> viewModel() async {
    final FakeMovieApi movieApi = FakeMovieApi();
    final FakeMovieDao movieDao = FakeMovieDao();
    final FakeFavoriteMovieDao favoriteMovieDao = FakeFavoriteMovieDao();
    final MovieRepository movieRepository =
        MovieRepository(movieDao, movieApi, favoriteMovieDao);
    final FavoritesMovieRepository favoriteMovieRepository =
        FavoritesMovieRepository(favoriteMovieDao);
    final LoginRepository loginRepository = LoginRepository();
    final MoviesViewModel viewModel = MoviesViewModel(
        movieRepository, favoriteMovieRepository, loginRepository);
    expect(viewModel.allMovies, isA<ResourceLoading>());
    expect(
        await asyncValue((_) => viewModel.allMovies), isA<ResourceSuccess>());
  }

  ;
  test('fake movie movie list exists', () {
    viewModel();
  });

  test('movie are stored in memory', () {
    //   //accesare view model
    //   //apelare
  });
}
