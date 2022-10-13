// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:movie_app/models/movie.dart';
// import 'package:movie_app/widgets/widgets.dart';
// import 'package:movie_app/models/movie.dart';


// class OutInCinema extends StatelessWidget {
//   final List<Movie> movieList;
//   // final String _baseURL = 'https://image.tmdb.org/t/p/w500';

//   // final _pageController = PageController();

//   const OutInCinema({Key? key, required this.movieList}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<Movie> movies = movieList;
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
//                 Movie movie = movies[index];
//                 return Container(
//                   height: 240,
//                   child: CachedNetworkImage(
//                     imageUrl:
//                         'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
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
