import 'package:flutter/material.dart';

import '../assets.dart';

class Stars extends StatelessWidget {
  final String title;
  const Stars({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: Text(title),
            constraints: const BoxConstraints(minWidth: 72),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(4),
                    topRight: Radius.circular(4)),
                color: Colors.red),
          ),
        ),
        Container(
          height: 88,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              scrollDirection: Axis.horizontal,
              itemCount: 10, //count the list
              itemBuilder: (context, index) => Image.asset(Assets.stars)),
        ),
      ],
    );
  }
}
