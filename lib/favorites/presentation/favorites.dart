import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/modelsMOCKED/favorite_model.dart';


class Favorites extends StatefulWidget {
  const Favorites({super.key});
  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<FavoritesModel>(builder: (context, value, child) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: value.favoritesMovies.length,
          itemBuilder: (context, index) {
            return Text('value.favoritesMovies[index].title');
          },
        );
      }),
    );
  }
}
