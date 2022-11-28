import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import '../../core/resource.dart';
import '../../favorites_movie/data/favorites_movie_repository.dart';
import '../data/movie_repository.dart';
import '../domain/movie.dart';
part 'movies_view_model.g.dart';

@injectable
class MoviesViewModel extends MoviesViewModelBase with _$MoviesViewModel {
  MoviesViewModel(final MovieRepository movieRepository, FavoritesMovieRepository favoriteRepository) : super(movieRepository,favoriteRepository );
}

abstract class MoviesViewModelBase with Store {
  final MovieRepository _movieRepository;
  final FavoritesMovieRepository _favoriteRepository;
  MoviesViewModelBase(this._movieRepository, this._favoriteRepository) {
    getPopularMovies();
    getMoviesRated();
    getNowPlayingMovies();
    getOutInCinema();
  }

  @computed
  bool get isLoading =>
      popularMovies is ResourceLoading ||
      topRatedMovies is ResourceLoading ||
      nowPlayingMovies is ResourceLoading ||
      outInCinema is ResourceLoading;

  @computed
  String? get loadingError =>
      popularMovies.mapOrNull(error: (value) => value.error) ??
      topRatedMovies.mapOrNull(error: (value) => value.error) ??
      nowPlayingMovies.mapOrNull(error: (value) => value.error) ??
      outInCinema.mapOrNull(error: (value) => value.error);

  @observable
  Resource<List<Movie>> popularMovies = Resource.initial();

  @observable
  Resource<List<Movie>> topRatedMovies = Resource.initial();

  @observable
  Resource<List<Movie>> nowPlayingMovies = Resource.initial();

  @observable
  Resource<List<Movie>> outInCinema = Resource.initial();

  // late ObservableStream<List<Movie>> moviesObs =
  //     _movieRepository.allPopularMovies().asObservable();

  // late ObservableStream<Set<int>> favoriteMovoieObs =
  //     _favoriteRepository.favoritesMovies().asObservable();


  // @computed
  // List<MovieModel> get allMovies {
  //   final movies = moviesObs.value;
  //   final favorite = favoriteMovoieObs.value;
  //   if (movies == null || favorite == null) {
  //     return [];
  //     }
  //     return movies.map((movie) {
  //       final bool favoriteMovie = favorite.contains(movie.id);
  //       return MovieModel(movie, favoriteMovie);
  //     }).toList();
  // }



  Future<void> getPopularMovies({final int page = 1}) async {
    popularMovies = Resource.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      _movieRepository.loadPopularMovies();
    } catch (ex) {
      popularMovies = Resource.error(error: ex.toString());
    }
  }

  Stream<List<Movie>> movieStream() {
    return _movieRepository.allPopularMovies();
  }

  Future<void> getMoviesRated({final int page = 1}) async {
    topRatedMovies = Resource.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      topRatedMovies = Resource.success(
          data: (await _movieRepository.getTopRatedMovies()).asObservable());
    } catch (ex) {
      topRatedMovies = Resource.error(error: ex.toString());
    }
  }

  Future<void> getNowPlayingMovies({final int page = 1}) async {
    nowPlayingMovies = Resource.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      nowPlayingMovies = Resource.success(
          data: (await _movieRepository.getNowPlayingMovies()).asObservable());
    } catch (ex) {
      nowPlayingMovies = Resource.error(error: ex.toString());
    }
  }

  Future<void> getOutInCinema({final int page = 1}) async {
    outInCinema = Resource.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      outInCinema = Resource.success(
          data: (await _movieRepository.getOutInCinema()).asObservable());
    } catch (ex) {
      outInCinema = Resource.error(error: ex.toString());
    }
  }

  //   Future<void> addFavouriteMovie(int id) async {
  //   await repository.addFavouriteMovie(id);
  // }
}
