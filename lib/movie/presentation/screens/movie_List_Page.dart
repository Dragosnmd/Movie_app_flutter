import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/app/assets.dart';
import 'package:movie_app/movie/domain/movieModel.dart';
import 'package:movie_app/movie/presentation/widgets/movieList.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../../../auth/data/login_repository.dart';
import '../../../auth/presentation/loginScreen.dart';
import '../../../core/injection.dart';
import '../../../favorites_movie/data/modelsMOCKED/favorite_model.dart';
import '../../domain/movie.dart';
import '../movies_view_model.dart';
import '../widgets/movieStars.dart';
import '../widgets/outInCinema.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final viewModel = getIt<MoviesViewModel>();
  // late Stream<List<MovieModel>> _getMovieList;
  // final signOut = getIt<LoginRepository>();
  // logout() async {
  //   await signOut.clearToken();
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  // } // MOVE  TO MOVIE VIEW MODEL

  @override
  void initState() {
    super.initState();
    // _getMovieList = viewModel.movieStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE41F2D),
        leading: Container(
          child: GestureDetector(
            onTap: () {
              viewModel.logout();
              context.goNamed('login');
            },
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
                  // Positioned(
                  //   top: 0,
                  //   left: 0,
                  //   child: Consumer<FavoritesModel>(
                  //       builder: (context, value, child) {
                  //     return Container(
                  //         width: 16,
                  //         height: 16,
                  //         decoration: BoxDecoration(
                  //             shape: BoxShape.circle, color: Colors.blue),
                  //         child: Text(
                  //           value.favoritesMovies.length.toString(),
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(fontSize: 10),
                  //         ));
                  //   }),
                  // )
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
          Observer(builder: (context) {
            return viewModel.outInCinema.map(
                initial: (_) => Center(child: CircularProgressIndicator()),
                loading: (_) => Center(child: CircularProgressIndicator()),
                error: (value) => Text(value.error),
                success: (value) =>
                    OutInCinema(title: 'Out in Cinema', movies: value.data));
          }),
          // Stars(title: 'Stars'),
          // Observer(builder: (context) {
          //   return viewModel.topRatedMovies.map(
          //       initial: (_) => Center(child: CircularProgressIndicator()),
          //       loading: (_) => Center(child: CircularProgressIndicator()),
          //       error: (value) => Text(value.error),
          //       success: (value) =>
          //           MovieList(title: 'Top Rated Movies', movies: value.data, toggleFavorite: (int movieId) {  },));
          // }),
          Observer(builder: (context) {
            return viewModel.allMovies.map(
                initial: (_) => Center(child: CircularProgressIndicator()),
                loading: (_) => Center(child: CircularProgressIndicator()),
                error: (value) => Text(value.error),
                success: (value) => MovieList(
                    title: 'Popular',
                    movies: value.data,
                    toggleFavorite: viewModel.toggleFavorite));
          }),
          // StreamBuilder<List<Movie>>(
          //     stream: _getMovieList,
          //     builder: (context, snapshot) {
          //       if (snapshot.hasError)
          //         return Text('There is an error');
          //       else if (snapshot.connectionState == ConnectionState.waiting)
          //         return CircularProgressIndicator();
          //       return MovieList(
          //           title: 'Get popular movies',
          //           movies: snapshot.requireData); //widget
          //     }),
          // Observer(builder: (context) {
          //   return viewModel.nowPlayingMovies.map(
          //       initial: (_) => Center(child: CircularProgressIndicator()),
          //       loading: (_) => Center(child: CircularProgressIndicator()),
          //       error: (value) => Text(value.error),
          //       success: (value) =>
          //           MovieList(title: 'Airing Today', movies: value.data));
          // }),
        ],
      ),
    );
  }
}
