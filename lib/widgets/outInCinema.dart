import 'package:flutter/material.dart';

class OutInCinema extends StatelessWidget {
  final List outInCinema;

  const OutInCinema({Key? key, required this.outInCinema}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              constraints: const BoxConstraints(minWidth: 72),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4)),
                  color: Colors.red),
            ),
          ),
          SizedBox(height: 10),
          Container(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: outInCinema.length,
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
                                          outInCinema[index]['backdrop_path']),
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
