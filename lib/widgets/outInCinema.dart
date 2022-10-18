// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:movie_app/models/movie_mocked.dart';
// import 'package:movie_app/widgets/widgets.dart';
// import 'package:movie_app/models/movie_mocked.dart';

// class OutInCinema extends StatefulWidget {
//   final List<MovieMocked> movieList;
//   // final String _baseURL = 'https://image.tmdb.org/t/p/w500';

//   // final _pageController = PageController();

//   const OutInCinema({Key? key, required this.movieList}) : super(key: key);

//   @override
//   State<OutInCinema> createState() => _OutInCinemaState();
// }

// class _OutInCinemaState extends State<OutInCinema> {
//   @override
//   Widget build(BuildContext context) {
//     List<MovieMocked> movies = widget.movieList;
//     return Container(
//         child: Column(
//       children: <Widget>[
//         Container(
//             margin: EdgeInsets.symmetric(vertical: 16),
//             height: 240,
//             // decoration: BoxDecoration(color: Colors.green),
//             child: PageView.builder(
//               itemCount: movies.length,
//               itemBuilder: (context, index) {
//                 MovieMocked movie = movies[index];
//                 return Container(
//                   height: 240,
//                   child: CachedNetworkImage(
//                     imageUrl:
//                         'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
//                     fit: BoxFit.cover,
//                   ),

//                   // decoration: BoxDecoration(
//                   //     image: DecorationImage(
//                   //         image: NetworkImage(
//                   //             _baseURL + content[index]['backdrop_path']),
//                   //         fit: BoxFit.cover)),
//                 );
//               },
//             ))
//       ],
//     ));
//   }
// }
