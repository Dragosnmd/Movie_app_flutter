import 'package:mobx/mobx.dart';
import 'package:movie_app/helpers/resource.dart';
import 'package:movie_app/movies/data/movie_api.dart';
import 'package:movie_app/movies/data/movie_repository.dart';
import 'package:movie_app/movies/domain/movie.dart';
import 'package:movie_app/storage_module/movie_dao.dart';
part 'movies_view_model.g.dart';

class MoviesViewModel = MoviesViewModelBase with _$MoviesViewModel;

abstract class MoviesViewModelBase with Store {
  MoviesViewModelBase() {
    getMovies();
    getMoviesRated();
    getNowPlayingMovies();
    getOutInCinema();
  }

  final repository = MovieRepository(MoviesDao(), MoviesApi());
  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  ObservableList<Movie> movies = <Movie>[].asObservable();

  @observable
  Resource<List<Movie>> popularMovies = Resource.initial();

  @observable
  Resource<List<Movie>> topRatedMovies = Resource.initial();

  @observable
  Resource<List<Movie>> nowPlayingMovies = Resource.initial();

  @observable
  Resource<List<Movie>> outInCinema = Resource.initial();

  // @action
  Future<void> getMovies({final int page = 1}) async {
    popularMovies = Resource.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      repository.loadMovies();
      // popularMovies = Resource.success(
      //     data: (await repository.getPopularMovies()).asObservable());
    } catch (ex) {
      popularMovies = Resource.error(error: ex.toString());
    }
  }

  Stream<List<Movie>> movieStream() {
    return repository.allMovies();
  }

  Future<void> getMoviesRated({final int page = 1}) async {
    topRatedMovies = Resource.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      topRatedMovies = Resource.success(
          data: (await repository.getTopRatedMovies()).asObservable());
    } catch (ex) {
      topRatedMovies = Resource.error(error: ex.toString());
    }
  }

  Future<void> getNowPlayingMovies({final int page = 1}) async {
    nowPlayingMovies = Resource.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      nowPlayingMovies = Resource.success(
          data: (await repository.getNowPlayingMovies()).asObservable());
    } catch (ex) {
      nowPlayingMovies = Resource.error(error: ex.toString());
    }
  }

  Future<void> getOutInCinema({final int page = 1}) async {
    outInCinema = Resource.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      outInCinema = Resource.success(
          data: (await repository.getOutInCinema()).asObservable());
    } catch (ex) {
      outInCinema = Resource.error(error: ex.toString());
    }
  }
}
