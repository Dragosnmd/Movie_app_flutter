import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/helpers/resource.dart';
import 'package:movie_app/movies/data/movie_repository.dart';
import 'package:movie_app/movies/domain/movie_details.dart';

part 'movie_details_view_model.g.dart';

@injectable
class MovieDetailsViewModel extends MovieDetailsViewModelBase
    with _$MovieDetailsViewModel {
  MovieDetailsViewModel(
      final MovieRepository repository, @factoryParam int movieId)
      : super(repository, movieId);
}

abstract class MovieDetailsViewModelBase with Store {
  final MovieRepository repository;
  final int movieId;
  MovieDetailsViewModelBase(this.repository, this.movieId) {
    _getDetails(movieId);
  }

  @observable
  Resource<MovieDetails> movieDetails = Resource.initial();

  Future<void> _getDetails(int id) async {
    movieDetails = Resource.loading();
    try {
      movieDetails = Resource.success(data: (await repository.getDetails(id)));
      // repository.getDetails(id);
    } catch (ex) {
      movieDetails = Resource.error(error: ex.toString());
    }
  }
}
