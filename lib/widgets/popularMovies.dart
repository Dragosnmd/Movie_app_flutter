import 'package:flutter/material.dart';

class Popular extends StatelessWidget {
  final List popularMovies;

  const Popular({Key? key, required this.popularMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text('Popular Movies'),
              constraints: const BoxConstraints(minWidth: 72),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  color: Colors.red),
            ),
          ),
          SizedBox(height: 10),
          Container(
              height: 200,
              child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemCount: popularMovies.length,
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
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          popularMovies[index]
                                              ['backdrop_path']),
                                  fit: BoxFit.cover),
                            ),
                            height: 150,
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
