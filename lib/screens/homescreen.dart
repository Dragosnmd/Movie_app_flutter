import 'package:flutter/material.dart';
import 'package:movie_app/assets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/screens/loginScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFE41F2D),
          elevation: 5,
          leading: Container(
            child: GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => loginScreen())),
              child: Image.asset(Assets.loginLogo),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () => print('tapped'),
              child: Image.asset(Assets.search),
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
                child: Container(
                    height: 250,
                    child: Image.asset(
                      Assets.marvel,
                      fit: BoxFit.fill,
                    )))
          ],
        ),
      ),
    );
  }
}
