import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/injection.dart';
import '../../domain/movie.dart';
import '../movie_details_view_model.dart';

class MovieList extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  // late final viewModel = getIt<MovieDetailsViewModel>(param1: movies);

  MovieList({
    super.key,
    required this.title,
    required this.movies,
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
                              decoration:
                                  BoxDecoration(color: Colors.transparent),
                              child:
                                  //                 IconButton(
                                  // onPressed: viewModel.toggleFavorite,
                                  // icon: Observer(
                                  //   builder: (BuildContext context) => viewModel.isFavorite
                                  //       ? const Icon(Icons.favorite)
                                  //       : const Icon(Icons.favorite_border),
                                  // ))

                                  GestureDetector(
                                onTap: () {
                                  // viewModel.toggleFavorite();
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
