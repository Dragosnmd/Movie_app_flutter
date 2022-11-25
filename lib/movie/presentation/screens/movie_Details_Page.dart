import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../core/injection.dart';
import '../../../favorites_movie/data/favorites_movie_view_model.dart';
import '../../domain/movie_details.dart';
import '../movie_details_view_model.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({super.key, required this.movieId});
  final int movieId;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late MovieDetailsViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = getIt<MovieDetailsViewModel>(param1: widget.movieId);
  }

  @override
  void didUpdateWidget(covariant MovieDetailPage oldWidget) {
    if (widget.movieId != oldWidget.movieId) {
      viewModel = getIt<MovieDetailsViewModel>(param1: widget.movieId);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return viewModel.movieDetails.map(
            initial: (_) => Center(child: CircularProgressIndicator()),
            loading: (_) => Center(child: CircularProgressIndicator()),
            error: (value) => Text(value.error),
            success: (value) => MovieDetailsWidget(movie: value.data));
      }),
    );
  }
}

class MovieDetailsWidget extends StatelessWidget {
  final MovieDetails movie;
  late final viewModel = getIt<FavourtiesMovieViewModel>(param1: movie.id);
  MovieDetailsWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFE41F2D),
          title: (Text(movie.title)),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: GestureDetector(
                  onTap: () {
                    viewModel.addFavouriteMovie(movie.id);
                  },
                  child: Icon(Icons.favorite_border, size: 28)),
            )
          ],
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 300,
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(movie.backdropPath))),
          ),
          SizedBox(height: 8),
          Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Overview'.toUpperCase()),
                  SizedBox(height: 4),
                  Text(
                    movie.overview,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Release date'.toUpperCase(),
                              style: Theme.of(context).textTheme.caption),
                          Text(movie.releaseDate,
                              style: Theme.of(context).textTheme.subtitle2),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('bugdet'.toUpperCase(),
                              style: Theme.of(context).textTheme.caption),
                          Text(movie.budget.toString(),
                              style: Theme.of(context).textTheme.subtitle2),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'status'.toUpperCase(),
                            style: Theme.of(context).textTheme.caption,
                          ),
                          Text(
                            movie.status,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ))
            ],
          )
        ]));
  }
}
