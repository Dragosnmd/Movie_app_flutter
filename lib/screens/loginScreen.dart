import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/assets.dart';
import 'package:movie_app/screens/homescreen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // Container(
      //   Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       SvgPicture.asset(
      //         Assets.background,
      //         width: double.infinity,
      //         fit: BoxFit.cover,
      //       ),
      //       Positioned(
      //           top: 60, child: Image.asset(Assets.popCorn, fit: BoxFit.cover)),
      //       Positioned(
      //         bottom: 115,
      //         child: GestureDetector(
      //           onTap: () =>
      //               Navigator.of(context, rootNavigator: true).pop('return'),
      //           child: Image.asset(Assets.loginB),
      //         ),
      //       ),
      //       Text('Welcome'),
      //       Text('Please enter your credentials'),
      //     ],
      //   ),
      // ),
      // );
      body: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            Assets.background,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 60,
              left: 140,
              child: Image.asset(Assets.popCorn, fit: BoxFit.cover)),
          Positioned(
            bottom: 115,
            left: 120,
            child: GestureDetector(
              onTap: () =>
                  Navigator.of(context, rootNavigator: true).pop('return'),
              child: Image.asset(Assets.loginB),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
