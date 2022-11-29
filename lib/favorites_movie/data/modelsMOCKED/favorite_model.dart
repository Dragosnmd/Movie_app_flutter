// import 'dart:collection';
// import 'package:flutter/cupertino.dart';

// import '../../../movie/domain/movie.dart';

// class FavoritesModel extends ChangeNotifier {
//   /// Internal, private state of the list
//   final List<Movie> _favoritesMovies = [];

//   UnmodifiableListView<Movie> get favoritesMovies =>
//       UnmodifiableListView(_favoritesMovies);

//   void add(Movie movie) {
//     _favoritesMovies.add(movie);
//     notifyListeners();
//   }

//   void removeAll() {
//     _favoritesMovies.clear();
//     // This call tells the widgets that are listening to this model to rebuild.
//     notifyListeners();
//   }

//   void remove(Movie movie) {
//     _favoritesMovies.remove(movie);
//     notifyListeners();
//   }
// }