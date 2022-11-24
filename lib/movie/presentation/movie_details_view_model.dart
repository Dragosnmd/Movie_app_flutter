import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import '../../core/resource.dart';
import '../data/movie_repository.dart';
import '../domain/movie_details.dart';




part 'movie_details_view_model.g.dart';

@injectable
class MovieDetailsViewModel extends MovieDetailsViewModelBase
    with _$MovieDetailsViewModel {
  MovieDetailsViewModel(
      final MovieRepository repository, @factoryParam int movieId)
      : super(repository, movieId);
}

abstract class MovieDetailsViewModelBase with Store {
  final MovieRepository _repository;
  final int _movieId;
  MovieDetailsViewModelBase(this._repository, this._movieId) {
    _getDetails(_movieId);
  }

  @observable
  Resource<MovieDetails> movieDetails = Resource.initial();
  

  Future<void> _getDetails(int id) async {
    movieDetails = Resource.loading();
    try {
      movieDetails =
          Resource.success(data: (await _repository.getMovieDetails(id)));
      // repository.getDetails(id);
    } catch (ex) {
      movieDetails = Resource.error(error: ex.toString());
    }
  }

  // Add to favourites
  // Future<void> addFavouriteMovie(MovieDetails movie) async {
  //   await _repository.addFavouriteMovie(movie);
  // }

// //
//     Stream<List<MovieDetails>> movieStream() {
//     return _repository.favoritesMovies();
//   }
//   //
}
