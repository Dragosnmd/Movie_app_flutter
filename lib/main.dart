import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/screens/screens.dart';
import 'package:provider/provider.dart';

import 'models/favorite_Model.dart';

void main() {
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
        primarySwatch: Colors.red,
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/login',
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
            path: 'detailPage',
            builder: (context, state) => const DetailPage(),
          ),
          GoRoute(
            name: 'favorites',
            path: 'favorites',
            builder: (context, state) => const Favorites(),
          )
        ]),
  ],
);
