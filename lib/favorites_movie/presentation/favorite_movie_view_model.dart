import 'package:injectable/injectable.dart';
import 'package:movie_app/favorites_movie/data/favorites_movie_repository.dart';

import 'package:movie_app/movie/data/movie_repository.dart';
import 'package:mobx/mobx.dart';

import '../../core/storage/app_database.dart';
import '../../movie/domain/movie.dart';

part 'favorite_movie_view_model.g.dart';

@injectable
class FavoriteViewModel extends FavoriteViewModelBase with _$FavoriteViewModel {
  FavoriteViewModel(final MovieRepository repository,
      final FavoritesMovieRepository favoritesMovieRepository)
      : super(
          repository,
          favoritesMovieRepository,
        );
}

abstract class FavoriteViewModelBase with Store {
  final MovieRepository repository;
  final FavoritesMovieRepository favoritesMovieRepository;

  FavoriteViewModelBase(this.repository, this.favoritesMovieRepository) {
    favoriteMovieStrem();
  }
  Stream<List<FavoriteMovie>> favoriteMovieStrem() {
    return repository.allFavoriteMovies();
  }

  Future<List<Movie>> getFavoriteMovies() {
    return favoritesMovieRepository.getFavoriteMovies();
  }
}
