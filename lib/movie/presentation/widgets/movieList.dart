import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/movie/domain/movieModel.dart';
import 'package:movie_app/movie/domain/movieModel.dart';

import '../../domain/movie.dart';

class MovieList extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;
  final Function(int movieId) toggleFavorite;

  MovieList(
      {super.key,
      required this.title,
      required this.movies,
      required this.toggleFavorite});

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
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        movies[index].movie.posterPath),
                                    fit: BoxFit.cover),
                              ),
                              height: 160,
                              child: GestureDetector(
                                onTap: () {
                                  context.goNamed('detailPage', params: {
                                    'movieId': movies[index].movie.id.toString()
                                  });
                                },
                              ),
                            ),
                            Container(
                                // height: 160,
                                // alignment: Alignment.bottomRight,
                                margin: EdgeInsets.only(left: 50, top: 110),
                                decoration:
                                    BoxDecoration(color: Colors.transparent),
                                child: IconButton(
                                    onPressed: () =>
                                        toggleFavorite(movies[index].movie.id),
                                    icon: movies[index].isFavorite
                                        ? const Icon(
                                            Icons.favorite,
                                            size: 28,
                                            color: Colors.red,
                                          )
                                        : const Icon(
                                            Icons.favorite,
                                            size: 28,
                                            color: Colors.white,
                                          )))
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
