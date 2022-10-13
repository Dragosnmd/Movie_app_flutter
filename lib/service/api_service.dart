// import 'dart:html';

// import 'package:dio/dio.dart';
// import 'package:movie_app/models/movie.dart';

// class ApiService {
//   final Dio _dio = Dio();

//   final String baseUrl = 'https://api.themoviedb.org/3';
//   final String apiKey = 'f1b8b13e0f1c7935c17d5b9e5b4f24e5';

//   Future<List<Movie>> getNowPlayingMovie() async {
//     try {
//       final url = '$baseUrl/movie/now_playing?$apiKey';
//       final response = await _dio.get(url);
//       var movies = response.data['results'] as List;
//       List<Movie> movieList = movies.map((m) => Movie.fromJson(m)).toList();
//       return movieList;
//     } catch (error, stacktrace) {
//       throw Exception("Execption $error with stracktrace $stacktrace");
//     }
//   }
// }
