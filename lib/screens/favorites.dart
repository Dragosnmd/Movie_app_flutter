import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorite_Model.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});
  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesModel>(builder: (context, value, child) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: value.favoritesMovies.length,
        itemBuilder: (context, index) {
          return Text(value.favoritesMovies[index].name);
        },
      );
    });
  }
}
