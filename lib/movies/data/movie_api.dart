import 'package:movie_app/movies/domain/movie.dart';
import 'package:movie_app/movies/models/popular_movies_response.dart';
import 'package:movie_app/networking/networking.dart';

class MoviesApi {
  final NetworkModule networkModule = NetworkModule();

  Future<List<Movie>> getPopularMovies({int page = 1}) async {
    final response = await networkModule.dio
        .get('/movie/popular', queryParameters: {'page': page});
    return PopularMoviesResponse.fromJson(response.data).toDomainList();
  }
}
