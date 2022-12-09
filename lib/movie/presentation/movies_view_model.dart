import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/auth/data/login_repository.dart';
import '../../core/resource.dart';
import '../../favorites_movie/data/favorites_movie_repository.dart';
import '../data/movie_repository.dart';
import '../domain/movie.dart';
import '../domain/movieModel.dart';
part 'movies_view_model.g.dart';

@injectable
class MoviesViewModel extends MoviesViewModelBase with _$MoviesViewModel {
  MoviesViewModel(
      final MovieRepository movieRepository,
      FavoritesMovieRepository favoriteRepository,
      LoginRepository loginRepository)
      : super(
          movieRepository,
          favoriteRepository,
          loginRepository,
        );
}

abstract class MoviesViewModelBase with Store {
  final MovieRepository _movieRepository;
  final FavoritesMovieRepository _favoriteRepository;
  final LoginRepository _loginRepository;
  MoviesViewModelBase(
      this._movieRepository, this._favoriteRepository, this._loginRepository) {
    getMoviesRated();
    getNowPlayingMovies();
    getOutInCinema();
    refreshPopularMovies();
  }

  // @computed
  // bool get isLoading =>
  //     popularMovies is ResourceLoading ||
  //     topRatedMovies is ResourceLoading ||
  //     nowPlayingMovies is ResourceLoading ||
  //     outInCinema is ResourceLoading;

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

  @observable
  Resource<List<Movie>> fakePopularMovies = Resource.initial();

  late ObservableStream<List<Movie>> moviesObs =
      _movieRepository.allPopularMovies().asObservable();

  late ObservableStream<Set<int>> favoriteMovoieObs =
      _favoriteRepository.favoritesMovies().asObservable();

  @computed
  Resource<List<MovieModel>> get allMovies {
    final movies = moviesObs.value;
    final favorite = favoriteMovoieObs.value;
    final request = popularMovieReqeust;

    if (movies == null || favorite == null || request == null) {
      return Resource.initial();
    }

    final data = movies.map((movie) {
      final bool favoriteMovie = favorite.contains(movie.id);
      return MovieModel(movie: movie, isFavorite: favoriteMovie);
    }).toList();

    if (request.error != null) {
      return Resource.error(error: request.error, data: data);
    }
    if (request.status == FutureStatus.pending) {
      return Resource.loading(data: data.isEmpty ? null : data);
    }
    if (request.value != data.length) {
      return Resource.loading();
    }

    return Resource.success(data: data);
  }

  Future<void> toggleFavorite(int movieId, bool favorite) async {
    if (favorite) {
      await _favoriteRepository.addFavouriteMovie(movieId);
    } else {
      await _favoriteRepository.removeFavoriteMovie(movieId);
    }
  }

  @observable
  ObservableFuture<int>? popularMovieReqeust;

  void refreshPopularMovies() {
    popularMovieReqeust =
        ObservableFuture(_movieRepository.loadPopularMovies());
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

  // Future<void> logout() async {
  //   await _loginRepository.clearToken();
  // }
}
