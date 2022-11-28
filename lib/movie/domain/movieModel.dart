import 'package:movie_app/movie/domain/movie.dart';

class MovieModel {
  final Movie movie;
  final bool isFavorite;
  MovieModel(this.movie, this.isFavorite);
}
