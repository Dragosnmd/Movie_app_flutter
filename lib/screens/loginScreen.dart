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
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color(0xffE41F2D),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const HeaderComponent(),
          RichText(
              text: TextSpan(
                  text: 'Welcome',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                  ))),
          RichText(
              text: TextSpan(
                  text: 'Please enter your credentials',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ))),
          const Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'E-mail',
                errorText: 'Error message',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 48, right: 48, bottom: 60, top: 16),
            child: TextFormField(
              style: TextStyle(color: Color(0xffb3b3b3)),
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: 'Error message',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 5)),
                suffixIcon: Icon(
                  Icons.remove_red_eye_outlined,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: ElevatedButton(
              // style: ElevatedButton.styleFrom(
              //     backgroundColor: Color.fromARGB(255, 247, 192, 74)),
              child: const Text('Login'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
          ),
          const Spacer(
            flex: 1,
          )
        ]),
      ),
    );
  }
}

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      //fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Image.asset(Assets.whiteAppScreen,
            width: double.infinity, fit: BoxFit.fill),
        Image.asset(Assets.popCornBucket)
      ],
    );
  }
}
