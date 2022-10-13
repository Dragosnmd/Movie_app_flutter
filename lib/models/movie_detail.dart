class MovieDetail {
  final String id;
  final String title;
  final String backdropPath;
  final String budget;
  final String homePage;
  final String originalTitle;
  final String overview;

  MovieDetail({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.budget,
    required this.homePage,
    required this.originalTitle,
    required this.overview,
  });

  factory MovieDetail.fromJson(dynamic json) {
    return MovieDetail(
        id: json['id'].toString(),
        title: json['title'],
        backdropPath: json['backdrop_path'],
        budget: json['budget'].toString(),
        homePage: json['home_page'],
        originalTitle: json['original_title'],
        overview: json['overview']);
  }
}
