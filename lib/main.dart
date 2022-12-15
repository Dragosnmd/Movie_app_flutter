import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/core/injection.dart';
import 'package:movie_app/movie/presentation/screens/movie_list_page.dart';
import 'package:provider/provider.dart';
import 'auth/data/login_repository.dart';
import 'auth/presentation/loginScreen.dart';
import 'favorites_movie/data/modelsMOCKED/favorite_model.dart';
import 'favorites_movie/presentation/favorites.dart';
import 'movie/presentation/screens/movie_details_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  mainContext.config = mainContext.config.clone(
    isSpyEnabled: true,
  );

  mainContext.spy((event) {
    if (event.type == 'reaction-error') {
      print('Error!!!! $event');
    }
  });

  runApp(MyApp());

  // runApp(ChangeNotifierProvider(
  //   create: (context) => FavoritesModel(),
  //   child: const MyApp(),
  // ));
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
