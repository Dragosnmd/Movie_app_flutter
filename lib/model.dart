class Movie {
  final int id;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final string title;

  String error;

  Movie(
      {this.id,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.title});

  factory mMovie.fromJson(dynamic json) {
    if (json == null) {
      return Movie();
    }

    return Movie(
        id: json['id'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        title: json['title']);
  }
}
