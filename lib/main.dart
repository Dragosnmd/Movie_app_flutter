import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/injecton/injection.dart';
import 'package:movie_app/login/login_repository.dart';
import 'package:movie_app/movies/models/favorite_model.dart';
import 'package:movie_app/movies/presentation/login_view_model.dart';
import 'package:movie_app/screens/screens.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final Future<SharedPreferences> sharedPreferences =
  //     SharedPreferences.getInstance();
  // await storageModule.initModule();
  // await initModulde();
  await configureDependencies();

  runApp(ChangeNotifierProvider(
    create: (context) => FavoritesModel(),
    child: const MyApp(),
  ));
}

// final getIt = GetIt.instance;

// Future<void> initModulde() async {
//   final StorageModule storageModule = await StorageModule.createModule();
//   getIt.registerSingleton<AppDatabase>(storageModule.database);

//   getIt.registerSingleton<SharedPreferences>(storageModule.sharedPreferences);

//   getIt.registerLazySingleton<MoviesDao>(
//       (() => MoviesDao(getIt<AppDatabase>())));
//   getIt.registerLazySingleton<NetworkModule>((() => NetworkModule()));

//   getIt.registerLazySingleton<MoviesApi>(
//       (() => MoviesApi(getIt<NetworkModule>())));
//   getIt.registerLazySingleton<AccountIdApi>(
//       (() => AccountIdApi(getIt<NetworkModule>())));

//   getIt.registerLazySingleton<LoginApi>(
//       (() => LoginApi(getIt<NetworkModule>())));

//   getIt.registerLazySingleton<SessionTokenApi>(
//       (() => SessionTokenApi(getIt<NetworkModule>())));

//   getIt.registerLazySingleton<GetRequestTokenApi>(
//       (() => GetRequestTokenApi(getIt<NetworkModule>())));

//   getIt.registerLazySingleton<MovieRepository>(
//       () => MovieRepository(getIt<MoviesDao>(), getIt<MoviesApi>()));

//   getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(
//       getIt<LoginApi>(),
//       getIt<GetRequestTokenApi>(),
//       getIt<SessionTokenApi>(),
//       getIt<SharedPreferences>()));

//   getIt.registerFactory<LoginViewModel>(
//       () => LoginViewModel(getIt<LoginRepository>()));
//   getIt.registerFactory<MoviesViewModel>(
//       () => MoviesViewModel(getIt<MovieRepository>()));
// }

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
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            name: 'detailPage',
            path: 'detailPage/:movieId',
            builder: (context, state) =>
                DetailPage(movieId: int.parse(state.params['movieId']!)),
          ),
          GoRoute(
            name: 'favorites',
            path: 'favorites',
            builder: (context, state) => const Favorites(),
          )
        ],
      ),
    ],
    redirect: (context, state) async {
      final loginRepository = getIt<LoginRepository>();
      if (await loginRepository.checkAuthentification())
        return null;
      else
        return '/login';
    });
