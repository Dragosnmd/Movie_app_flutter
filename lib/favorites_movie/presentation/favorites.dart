import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:movie_app/favorites_movie/data/favorite_movie.dart';
import 'package:movie_app/movie/domain/movie_details.dart';
import '../../app/assets.dart';
import '../../core/injection.dart';
import '../../core/storage/app_database.dart';  ///
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
      body: StreamBuilder<List<FavoriteMovie>>(
          stream: favoriteViewModel.favoriteMovieStrem(),
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Text('There is an error');
            else if (snapshot.connectionState == ConnectionState.waiting)
              return CircularProgressIndicator();
            return FavoritesWidget(movies: snapshot.requireData); //widget
          }),
    );
  }
}

class FavoritesWidget extends StatelessWidget {
  final List<FavoriteMovie> movies;
  FavoritesWidget({
    super.key,
    required this.movies,
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
            itemCount: 5,
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
                            image: const DecorationImage(
                                image: AssetImage(Assets.avengers),
                                // CachedNetworkImageProvider(
                                // movies[index].title),
                                fit: BoxFit.cover),
                          )),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Text('this is a long titile'),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Icon(Icons.favorite)
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
