import 'dart:convert';
import 'package:flutter/services.dart';

class PopularMovieFApi {



  
Future<void> readJson() async {
final String response = await rootBundle.loadString('assets/popularMovies.json');
final data = await json.decode(response);

}
}
