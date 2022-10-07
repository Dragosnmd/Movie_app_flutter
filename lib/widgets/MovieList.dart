import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final String title;
  final List content;
  final String _baseURL = 'https://image.tmdb.org/t/p/w500';

  const MovieList({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(title),
              constraints: BoxConstraints(minWidth: 72),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
              height: 192,
              child: ListView.builder(
                  padding: EdgeInsets.all(8),
                  scrollDirection: Axis.horizontal,
                  itemCount: content.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      width: 100,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(_baseURL +
                                      content[index]['backdrop_path']),
                                  fit: BoxFit.cover),
                            ),
                            height: 160,
                          ),
                          SizedBox(height: 4),
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
