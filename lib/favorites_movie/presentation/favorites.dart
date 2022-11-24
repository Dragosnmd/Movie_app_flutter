import 'package:flutter/material.dart';
import 'package:movie_app/movie/domain/movie.dart';
import 'package:movie_app/movie/domain/movie_details.dart';
import '../../core/injection.dart';
import '../../movie/presentation/movie_details_view_model.dart';
import 'favorites_widget.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});
  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final viewModel = getIt<MovieDetailsViewModel>();
  late Stream<MovieDetails> _getFavoritesMovies;

  @override
  void initState() {
    super.initState();
    // _getFavoritesMovies = viewModel.movieStream();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: StreamBuilder<List<Movie>>(
          // stream: _getFavoritesMovies,
          // builder: (context, snapshot) {
          //   if (snapshot.hasError)
          //     return Text('There is an error');
          //   else if (snapshot.connectionState == ConnectionState.waiting)
          //     return CircularProgressIndicator();
          //   return FavoriteSectionWidget(
          //       movies: [snapshot.requireData]); //widget
          // }),
    );
  }
}
