import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/injection.dart';
import '../../../favorites_movie/data/favorites_movie_view_model.dart';
import '../../domain/movie.dart';
import '../../domain/movie_details.dart';

// import 'package:flutter_mobx/flutter_mobx.dart';

class MovieList extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  // final MovieDetails movie;
  // late final viewModel = getIt<FavourtiesMovieViewModel>(param1: movie.id);

  MovieList({
    super.key,
    required this.title,
    required this.movies, 
    // required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(title),
              constraints: BoxConstraints(minWidth: 72),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  color: Colors.red),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            height: 192,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(8),
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    width: 100,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        movies[index].posterPath),
                                    fit: BoxFit.cover),
                              ),
                              height: 160,
                              child: GestureDetector(
                                onTap: () {
                                  context.goNamed('detailPage', params: {
                                    'movieId': movies[index].id.toString()
                                  });
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 60, top: 128),
                              // padding: EdgeInsets.only(right: 0, bottom: 0),
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child: GestureDetector(
                                onTap: () {
                                  print(movies[index].id.toString());
                                  // viewModel.addFavoriteMovie('movie.id':movies[index].id);
                                },
                                child: Icon(
                                  Icons.favorite,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 4),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
