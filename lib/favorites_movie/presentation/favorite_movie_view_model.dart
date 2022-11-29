import 'package:injectable/injectable.dart';

import 'package:movie_app/movie/data/movie_repository.dart';
import 'package:mobx/mobx.dart';

import '../../core/storage/app_database.dart';

part 'favorite_movie_view_model.g.dart';

@injectable
class FavoriteViewModel extends FavoriteViewModelBase with _$FavoriteViewModel {
  FavoriteViewModel(final MovieRepository repository) : super(repository);
}

abstract class FavoriteViewModelBase with Store {
  final MovieRepository repository;
  FavoriteViewModelBase(this.repository) {
    favoriteMovieStrem();
  }
  Stream<List<FavoriteMovie>> favoriteMovieStrem() {
    return repository.allFavoriteMovies();
  }
}
