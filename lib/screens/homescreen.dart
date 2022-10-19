import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/assets.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/movies/data/movie_mocked.dart';
import 'package:movie_app/movies/models/favorite_model.dart';
import 'package:movie_app/movies/presentation/movies_view_model.dart';

import 'package:movie_app/screens/screens.dart';
import 'package:movie_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/tmdb_api.dart';

import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final viewModel = MoviesViewModel();
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<FavoritesModel>(context, listen: false)
              .add(MovieMocked(id: 1, name: 'Movie 1', posterPath: 'abcd'));
        },
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE41F2D),
        elevation: 5,
        leading: Container(
          child: GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LoginScreen())),
            child: Image.asset(Assets.loginLogo),
          ),
        ),
        actions: [
          GestureDetector(
              onTap: () {
                context.goNamed('favorites');
              },
              child: Stack(
                // alignment: AlignmentDirectional.center,
                children: [
                  Icon(Icons.favorite_border, size: 30),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Consumer<FavoritesModel>(
                        builder: (context, value, child) {
                      return Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blue),
                          child: Text(
                            value.favoritesMovies.length.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          ));
                    }),
                  )
                ],
              )),
          const SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () => print('tapped'),
            child: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 8,
          )
        ],
      ),
      body: ListView(
        children: [
          OutInCinema(
            title: 'out in cinema',
          ),
          Stars(title: 'Stars'),
          Observer(builder: (context) {
            return viewModel.topRatedMovies.map(
                initial: (_) => Center(child: CircularProgressIndicator()),
                loading: (_) => Center(child: CircularProgressIndicator()),
                error: (value) => Text(value.error),
                success: (value) =>
                    MovieList(title: 'Top Rated Movies', movies: value.data));
          }),
          Observer(builder: (context) {
            return viewModel.popularMovies.map(
                initial: (_) => Center(child: CircularProgressIndicator()),
                loading: (_) => Center(child: CircularProgressIndicator()),
                error: (value) => Text(value.error),
                success: (value) =>
                    MovieList(title: 'Popular Movies', movies: value.data));
          }),
          Observer(builder: (context) {
            return viewModel.nowPlayingMovies.map(
                initial: (_) => Center(child: CircularProgressIndicator()),
                loading: (_) => Center(child: CircularProgressIndicator()),
                error: (value) => Text(value.error),
                success: (value) =>
                    MovieList(title: 'Airing Today', movies: value.data));
          }),
        ],
      ),
    );
  }
}
