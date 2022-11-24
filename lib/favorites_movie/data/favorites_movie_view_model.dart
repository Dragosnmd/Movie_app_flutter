import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import '../../movie/domain/movie_details.dart';
import 'favorites_movie_repository.dart';

part 'favorites_movie_view_model.g.dart';

@injectable
class FavourtiesMovieViewModel extends FavourtiesMovieViewModelBase
    with _$FavourtiesMovieViewModel {
  FavourtiesMovieViewModel(final FavoritesMovieRepository repository)
      : super(repository);
}

abstract class FavourtiesMovieViewModelBase with Store {
  final FavoritesMovieRepository _repository;

  FavourtiesMovieViewModelBase(this._repository) {}

// @observable

  // Add to favourites
  Future<void> addFavouriteMovie(MovieDetails movie) async {
    await _repository.addFavouriteMovie(movie);
  }
}





































// import 'dart:collection';
// import 'package:flutter/cupertino.dart';
// import 'package:movie_app/movie/domain/movie.dart';

// class FavoritesMovieViewModel extends ChangeNotifier {
//   /// Internal, private state of the list
//   // final List<MovieMocked> _favoritesMovies = [];
//     final List<Movie> _favoritesMovies = [];

//   UnmodifiableListView<Movie> get favoritesMovies =>
//       UnmodifiableListView(_favoritesMovies);

//   void add(Movie movie) {
//     _favoritesMovies.add(movie);
//     notifyListeners();
//   }

//   void removeAll() {
//     _favoritesMovies.clear();
  
//     notifyListeners();
//   }

//   void remove(Movie movie) {
//     _favoritesMovies.remove(movie);
//     notifyListeners();
//   }
// }

