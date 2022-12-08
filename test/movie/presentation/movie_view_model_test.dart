import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/auth/data/login_repository.dart';
import 'package:movie_app/core/injection.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/favorites_movie/data/favorites_movie_repository.dart';
import 'package:movie_app/movie/data/movie_repository.dart';
import 'package:movie_app/movie/domain/movie.dart';
import 'package:movie_app/movie/domain/movieModel.dart';
import 'package:movie_app/movie/presentation/movies_view_model.dart';

import '../../core/injection.dart';
import '../data/fake_favoriteMovie_dao.dart';
import '../../../lib/movie/data/fake_movie_api.dart';
import '../data/fake_movie_dao.dart';
import '../../utils/test_mobx.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() async {
    await configureTestDependencies();
  });

  tearDown(() async {
    await getIt.reset();
  });

  test('fake movie movie list exists', () async {
    final viewModel = getIt<MoviesViewModel>();
    expect(viewModel.allMovies, isA<ResourceLoading>());
    expect(await asyncValue((_) => viewModel.allMovies),
        const Resource<List<MovieModel>>.success(data: []));

    expect(
        await asyncValue((_) => viewModel.allMovies),
        Resource<List<MovieModel>>.success(data: [
          MovieModel(
              Movie(
                backdropPath: "/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
                id: 436270,
                originalTitle: "Black Adam",
                overview:
                    "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
                posterPath: "/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
                title: "Black Adam",
              ),
              false),
        ]));
  });

  test('movie are stored in memory', () {
    //   //accesare view model
    //   //apelare
  });
}
