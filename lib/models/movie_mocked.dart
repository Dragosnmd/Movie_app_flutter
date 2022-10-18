// class Movie {
//   final String backdropPath;
//   final int id;
//   final String originalLanguage;
//   final String originalTitle;
//   final String overview;
//   final double popularity;
//   final String posterPath;
//   final String releaseDate;
//   final String title;

//   Movie({
//     required this.backdropPath,
//     required this.id,
//     required this.originalLanguage,
//     required this.originalTitle,
//     required this.overview,
//     required this.popularity,
//     required this.posterPath,
//     required this.releaseDate,
//     required this.title,
//   });

//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       backdropPath: json['backdrop_path'],
//       id: json['id'],
//       originalLanguage: json['original_language'],
//       originalTitle: json['original_title'],
//       overview: json['overview'],
//       popularity: json['popularity'],
//       posterPath: json['poster_path'],
//       releaseDate: json['release_date'],
//       title: json['title'],
//     );
//   }
// }

import 'package:flutter/material.dart';

class MovieMocked {
  final int id;
  final String name, posterPath;

  MovieMocked({required this.id, required this.name, required this.posterPath});
}

List<MovieMocked> movies = [
  MovieMocked(
      id: 1,
      name: 'Movie 1',
      posterPath:
          'https://www.indiewire.com/wp-content/uploads/2019/12/ad-astra.jpg?w=500'),
  MovieMocked(
      id: 2,
      name: 'Movie 2',
      posterPath:
          'https://www.indiewire.com/wp-content/uploads/2019/12/beach_bum.jpg?w=510'),
  MovieMocked(
      id: 3,
      name: 'Movie 3',
      posterPath:
          'https://www.indiewire.com/wp-content/uploads/2019/12/dark-phoenix.jpg?w=856'),
];
