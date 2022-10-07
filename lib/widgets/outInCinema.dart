import 'package:flutter/material.dart';

class OutInCinema extends StatelessWidget {
  final List content;
  final String _baseURL = 'https://image.tmdb.org/t/p/w500';

  // final _pageController = PageController();

  const OutInCinema({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            height: 240,
            // decoration: BoxDecoration(color: Colors.green),
            child: PageView.builder(
              itemCount: content.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              _baseURL + content[index]['backdrop_path']),
                          fit: BoxFit.cover)),
                );
              },
            ))
      ],
    ));
  }
}
