import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/favorites_movie/data/favorite_movie.dart';
import 'package:movie_app/movie/domain/movieModel.dart';
import 'package:movie_app/movie/domain/movie_details.dart';
import '../../app/assets.dart';
import '../../core/injection.dart';
// import '../../core/storage/app_database.dart';  ///
import '../../movie/domain/movie.dart';
import 'favorite_movie_view_model.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});
  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  late FavoriteViewModel favoriteViewModel;

  @override
  void initState() {
    super.initState();
    favoriteViewModel = getIt<FavoriteViewModel>();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: favoriteViewModel.getFavoriteMovies(),
      builder: (context, snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          return FavoritesWidget(movies: snapshot.requireData);
        }
        return Center(child: const CircularProgressIndicator());
      },
    )

        // Observer(builder: (context) {
        //       return favoriteViewModel.getFavoriteMovies().map(;
        //           initial: (_) => Center(child: CircularProgressIndicator()),
        //           loading: (_) => Center(child: CircularProgressIndicator()),
        //           error: (value) => Text(value.error),
        //           success: (value) => FavoritesWidget(movies: [],));
        // body: StreamBuilder<List<FavoriteMovie>>(
        //     stream: favoriteViewModel.getFavoriteMovies(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasError)
        //         return Text('There is an error');
        //       else if (snapshot.connectionState == ConnectionState.waiting)
        //         return CircularProgressIndicator();
        //       return FavoritesWidget(movies: snapshot.requireData); //widget
        //     }),
        );
  }
}

class FavoritesWidget extends StatelessWidget {
  final List<Movie> movies;
  // final Function(int movieId) toggleFavorite;
  const FavoritesWidget({
    super.key,
    required this.movies,
    // required this.toggleFavorite
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Favorites'),
          backgroundColor: const Color(0xFFE41F2D),
        ),
        body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.all(8),
            scrollDirection: Axis.vertical,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          padding: EdgeInsets.all(5),
                          width: 104,
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image:
                                    // AssetImage(Assets.avengers),
                                    CachedNetworkImageProvider(
                                        movies[index].posterPath),
                                fit: BoxFit.cover),
                          )),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: Text(
                        movies[index].title,
                        style: TextStyle(fontSize: 20),
                      )),
                      SizedBox(
                        width: 16,
                      ),
                      Icon(Icons.favorite
                          // onPressed: () =>
                          //     toggleFavorite(movies[index].movie.id),
                          // icon: movies[index].isFavorite
                          //     ? const Icon(
                          //         Icons.favorite,
                          //         size: 28,
                          //         color: Colors.red,
                          //       )
                          //     : const Icon(
                          //         Icons.favorite,
                          //         size: 28,
                          //         color: Colors.white,
                          //       )
                          ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              );
            }));
  }
}
