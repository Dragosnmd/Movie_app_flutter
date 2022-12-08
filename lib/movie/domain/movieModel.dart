import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/movie.dart';

@freezed
class MovieModel {
  final Movie movie;
  final bool isFavorite;
  MovieModel(this.movie, this.isFavorite);
}
