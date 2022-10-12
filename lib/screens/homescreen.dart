import 'package:flutter/material.dart';
import 'package:movie_app/assets.dart';
import 'package:movie_app/screens/screens.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List topRatedMovies = [];
  List popularMovies = [];
  List airingToday = [];
  List outInCinema = [];
  List starsInCinema = [];
  final String apikey = 'f1b8b13e0f1c7935c17d5b9e5b4f24e5';
  final accesToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMWI4YjEzZTBmMWM3OTM1YzE3ZDViOWU1YjRmMjRlNSIsInN1YiI6IjYyZTkzZmNmMWFkOTNiMDA1ZTEwNGE2MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.b3-dWmZq9mQurGHDtZoMrFOi1kcSSvIK7R0JQ97uF4I';

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ApiKeys(apikey, accesToken),
      logConfig: ConfigLogger(showLogs: true, showErrorLogs: true),
    );
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map popularMoviesResult = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map airingTodayResult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    Map outInCinemaResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map starsInCinemaResult = await tmdbWithCustomLogs.v3.people.getPopular();

    setState(() {
      topRatedMovies = topRatedResult['results'];
      popularMovies = popularMoviesResult['results'];
      airingToday = airingTodayResult['results'];
      outInCinema = outInCinemaResult['results'];
      // starsInCinema = starsInCinemaResult['result'];
    });
    print(starsInCinema);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE41F2D),
        elevation: 5,
        leading: Container(
          child: GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => loginScreen())),
            child: Image.asset(Assets.loginLogo),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              context.goNamed('favorites');
            },
            child: Icon(
              Icons.favorite_border,
              size: 30,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          GestureDetector(
            onTap: () => print('tapped'),
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          SizedBox(
            width: 8,
          )
        ],
      ),
      body: ListView(
        children: [
          OutInCinema(content: outInCinema),
          Stars(title: 'Stars'),
          MovieList(title: 'Top Rated Movies', content: topRatedMovies),
          MovieList(title: 'Popular Movies', content: popularMovies),
          MovieList(title: 'Airing Today', content: airingToday)
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite_border),
      //       label: 'Favorites',
      //     ),
      //   ],
      // ),
    );
  }
}
