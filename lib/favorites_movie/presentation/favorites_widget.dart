import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/movie/domain/movie_details.dart';

class FavoriteSectionWidget extends StatelessWidget {
  final List<MovieDetails> movies;
  const FavoriteSectionWidget({super.key, required this.movies});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(movies[index].posterPath),
                          fit: BoxFit.fill),
                    ),
                    height: 200,
                    child: GestureDetector(
                      onTap: () {
                        context.goNamed('detailPage',
                            params: {'movieId': movies[index].id.toString()});
                      },
                    ),
                  ),
                  SizedBox(height: 4),
                ],
              ),
            );
          }),
    );
  }
}