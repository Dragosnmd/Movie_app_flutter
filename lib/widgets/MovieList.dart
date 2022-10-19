import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/movies/domain/movie.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/movies/presentation/movies_view_model.dart';

class MovieList extends StatefulWidget {
  final String title;
  final List<Movie> movies;

  const MovieList({super.key, required this.title, required this.movies});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
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
              child: Text(widget.title),
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
                itemCount: widget.movies.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    width: 100,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                    widget.movies[index].posterPath),
                                fit: BoxFit.cover),
                          ),
                          height: 160,
                          child: GestureDetector(
                            onTap: () {
                              context.goNamed('detailPage');
                            },
                          ),
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
