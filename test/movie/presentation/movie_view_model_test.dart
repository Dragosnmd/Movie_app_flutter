import 'package:flutter_test/flutter_test.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/core/injection.dart';
import 'package:movie_app/core/resource.dart';
import 'package:movie_app/movie/data/movie_api.dart';
import 'package:movie_app/movie/domain/movie.dart';
import 'package:movie_app/movie/domain/movieModel.dart';
import 'package:movie_app/movie/presentation/movies_view_model.dart';

import '../../core/injection.dart';
import 'package:movie_app/movie/data/fake_movie_api.dart';
import '../../utils/test_mobx.dart';

void main() {
  setUpAll(() async {
    await TestWidgetsFlutterBinding.ensureInitialized();

    mainContext.config = mainContext.config.clone(
      isSpyEnabled: true,
      disableErrorBoundaries: true,
      readPolicy: ReactiveReadPolicy.always,
      writePolicy: ReactiveWritePolicy.always,
    );

    mainContext.spy((event) {
      if (event.type == 'reaction-error') {
        print('Error!!!! $event');
      }
    });
  });

  setUp(() async {
    await configureTestDependencies();
  });

  tearDown(() async {
    await getIt.reset();
  });

  test('fake movie movie list exists', () async {
    final viewModel = getIt<MoviesViewModel>();
    expect(viewModel.allMovies, isA<ResourceInitial>());
    expect(
        await asyncValue((_) => viewModel.allMovies), isA<ResourceLoading>());
    expect(
        await asyncValue((_) => viewModel.allMovies),
        Resource<List<MovieModel>>.success(data: [
          MovieModel(
              movie: Movie(
                backdropPath:
                    "https://image.tmdb.org/t/p/w500/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
                id: 436270,
                originalTitle: "Black Adam",
                overview:
                    "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
                posterPath:
                    "https://image.tmdb.org/t/p/original/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
                title: "Black Adam",
              ),
              isFavorite: false),
        ]));
  });

  test('add movie to favorite', () async {
  final viewModel = getIt<MoviesViewModel>();

    viewModel.toggleFavorite(436270, true);
    streamOf((_) => viewModel.allMovies);
    expect(viewModel.allMovies, isA<ResourceInitial>());
    expect(
        await asyncValue((_) => viewModel.allMovies), isA<ResourceLoading>());
    expect(
        await asyncValue((_) => viewModel.allMovies),
        Resource<List<MovieModel>>.success(data: [
          MovieModel(
              movie: Movie(
                backdropPath:
                    "https://image.tmdb.org/t/p/w500/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
                id: 436270,
                originalTitle: "Black Adam",
                overview:
                    "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
                posterPath:
                    "https://image.tmdb.org/t/p/original/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
                title: "Black Adam",
              ),
              isFavorite: true),

        ]));

  });
  test('remove from favorties',() async{
      final viewModel = getIt<MoviesViewModel>();
    streamOf((_) => viewModel.allMovies);
    expect(viewModel.allMovies, isA<ResourceInitial>());
    expect(
        await asyncValue((_) => viewModel.allMovies), isA<ResourceLoading>());
      expect(
        await asyncValue((_) => viewModel.allMovies),
        Resource<List<MovieModel>>.success(data: [
          MovieModel(
              movie: Movie(
                backdropPath:
                    "https://image.tmdb.org/t/p/w500/bQXAqRx2Fgc46uCVWgoPz5L5Dtr.jpg",
                id: 436270,
                originalTitle: "Black Adam",
                overview:
                    "Nearly 5,000 years after he was bestowed with the almighty powers of the Egyptian gods—and imprisoned just as quickly—Black Adam is freed from his earthly tomb, ready to unleash his unique form of justice on the modern world.",
                posterPath:
                    "https://image.tmdb.org/t/p/original/pFlaoHTZeyNkG83vxsAJiGzfSsa.jpg",
                title: "Black Adam",
              ),
              isFavorite: false),

        ]));
  });
  test('movie list failed', () async {
    final fakeApi = getIt<MoviesApi>() as FakeMovieApi;
    fakeApi.exception = Exception('Dragos');
    final viewModel = getIt<MoviesViewModel>();
    expect(viewModel.allMovies, isA<ResourceInitial>());

    reaction((fn) => viewModel.allMovies, (resource) {
      print("XXX full-reaction $resource");
    }, fireImmediately: true);

    expect(
        await asyncValue((_) => viewModel.allMovies), isA<ResourceLoading>());
    expect(await asyncValue((_) => viewModel.allMovies), isA<ResourceError>());
  });
}
