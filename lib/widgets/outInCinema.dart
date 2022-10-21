import 'package:flutter/material.dart';
import 'package:movie_app/movies/domain/movie.dart';

class OutInCinema extends StatefulWidget {
  final String title;
  final List<Movie> movies;

  const OutInCinema({Key? key, required this.title, required this.movies})
      : super(key: key);

  @override
  State<OutInCinema> createState() => _OutInCinemaState();
}

class _OutInCinemaState extends State<OutInCinema> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 240,
            child: PageView.builder(
              itemCount: widget.movies.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Image(
                      image: NetworkImage(
                        widget.movies[index].backdropPath,
                      ),
                      fit: BoxFit.cover),
                );
              },
            ))
      ],
    ));
  }
}
