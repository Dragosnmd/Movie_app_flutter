import 'package:flutter/material.dart';
import 'package:movie_app/movie/domain/movie_details.dart';
import '../../core/injection.dart';
import '../../movie/domain/movie.dart';
import '../data/favorites_movie_view_model.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});
  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  // final viewModel = getIt<FavourtiesMovieViewModel>();
  late Stream<List<Movie>> _getFavoritesMovies;

  @override
  void initState() {
    super.initState();
    // _getFavoritesMovies = viewModel.movieFavoritesStream();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: StreamBuilder<List<FavourtiesMovieViewModel>>(
      //     stream: _getFavoritesMovies,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasError)
      //         return Text('There is an error');
      //       else if (snapshot.connectionState == ConnectionState.waiting)
      //         return CircularProgressIndicator();
      //       return FavoriteSectionWidget(
      //           movies: [snapshot.requireData]); //widget
      //     }),
    );
  }
}
