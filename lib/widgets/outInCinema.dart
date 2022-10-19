import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/movies_view_model.dart';

class OutInCinema extends StatefulWidget {
  final String title;

  const OutInCinema({Key? key, required this.title}) : super(key: key);

  @override
  State<OutInCinema> createState() => _OutInCinemaState();
}

class _OutInCinemaState extends State<OutInCinema> {
  @override
  Widget build(BuildContext context) {
    // final viewModel = MoviesViewModel();
    return Container(
        child: Column(
      children: <Widget>[
        // Container(
        //     margin: EdgeInsets.symmetric(vertical: 16),
        //     height: 240,
        //     // decoration: BoxDecoration(color: Colors.green),
        //     child: PageView.builder(
        //       itemCount: viewModel.movies.length,
        //       itemBuilder: (context, index) {
        //         return Container(
        //           height: 240,
        //           child: Image(
        //               image: NetworkImage(
        //                 viewModel.movies[index].posterPath,
        //               ),
        //               fit: BoxFit.cover),
        //         );
        //       },
        //     ))
      ],
    ));
  }
}
