import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/favorites_movie/data/favorites_movie_repository.dart';
import '../../core/resource.dart';
import '../../core/storage/app_database.dart';
import '../data/movie_repository.dart';
import '../domain/movie_details.dart';

part 'movie_details_view_model.g.dart';

@injectable
class MovieDetailsViewModel extends MovieDetailsViewModelBase
    with _$MovieDetailsViewModel {
  MovieDetailsViewModel(final MovieRepository repository,
      @factoryParam int movieId, FavoritesMovieRepository favoriteRepository)
      : super(
          repository,
          favoriteRepository,
          movieId,
        );
}

abstract class MovieDetailsViewModelBase with Store {
  final MovieRepository _movieRepository;
  final FavoritesMovieRepository _favoriteRepository;
  final int _movieId;
  MovieDetailsViewModelBase(
      this._movieRepository, this._favoriteRepository, this._movieId) {
    _getDetails(_movieId);
  }

  @observable
  Resource<MovieDetails> movieDetails = Resource.initial();

  Future<void> _getDetails(int id) async {
    movieDetails = Resource.loading();
    try {
      movieDetails =
          Resource.success(data: (await _movieRepository.getMovieDetails(id)));
      // repository.getDetails(id);
    } on Exception catch (ex, st) {
      movieDetails = Resource.error(error: ex);
    }
  }

  late ObservableStream<bool> isFavouriteObs =
      _favoriteRepository.isFavorite(_movieId).asObservable();

  @computed
  bool get isFavorite => isFavouriteObs.value ?? false;

  Future<void> toggleFavorite() async {
    if (isFavorite == false) {
      await _favoriteRepository.addFavouriteMovie(_movieId);
    } else {
      await _favoriteRepository.removeFavoriteMovie(_movieId);
    }
  }

  Stream<List<FavoriteMovie>> favoriteMovieStrem() {
    return _movieRepository.allFavoriteMovies();
  }
}
