import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/core/injection.dart';
import 'package:movie_app/movie/presentation/screens/movieListPage.dart';
import 'package:provider/provider.dart';
import '../auth/data/login_repository.dart';
import '../auth/presentation/loginScreen.dart';
import '../favorites/data/modelsMOCKED/favorite_model.dart';
import '../favorites/presentation/favorites.dart';
import '../movie/presentation/screens/movie_Details_Page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(ChangeNotifierProvider(
    create: (context) => FavoritesModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
    // initialLocation: '/',
    routes: [
      GoRoute(
        name: 'login',
        path: '/login',
        builder: (context, state) {
          return const LoginScreen();
        },
        //routes: []
      ),
      GoRoute(
        name: 'homescreen',
        path: '/',
        builder: (context, state) => const MovieListPage(),
        routes: [
          GoRoute(
            name: 'detailPage',
            path: 'detailPage/:movieId',
            builder: (context, state) =>
                MovieDetailPage(movieId: int.parse(state.params['movieId']!)),
          ),
          GoRoute(
            name: 'favorites',
            path: 'favorites',
            builder: (context, state) => const Favorites(),
          )
        ],
      ),
    ],
    redirect: (context, state) {
      final loginRepository = getIt<LoginRepository>();
      if (loginRepository.isLoggedIn)
        return null;
      else
        return '/login';
    });
