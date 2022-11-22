import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/assets.dart';
import 'package:movie_app/auth/presentation/login_view_model.dart';

import '../../core/injection.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Theme(
        data: ThemeData(
            backgroundColor: Colors.green,
            brightness: Brightness.dark,
            // primaryColor: Colors.white,
            primarySwatch: Colors.grey),
        child: LoginContent());
  }
}

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(Assets.whiteAppScreen,
            width: double.infinity, fit: BoxFit.fill),
        Image.asset(Assets.popCornBucket)
      ],
    );
  }
}

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  late final TextEditingController userNameController, passwordController;
  late final LoginViewModel viewModel;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    viewModel = getIt<LoginViewModel>();
    when((_) => viewModel.succesLogin, () {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        context.goNamed('homescreen');
      });
    });
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const HeaderComponent(),
              Text('Welcome',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.white)),
              SizedBox(height: 8),
              Text('Please enter your credentials',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 40),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: TextFormField(
                        controller: userNameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 48, right: 48, bottom: 60, top: 16),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        style: const TextStyle(color: Color(0xffb3b3b3)),
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          errorBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1)),
                          suffixIcon: Icon(
                            Icons.remove_red_eye_outlined,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 56),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfff7c04a),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text('Login'),
                          onPressed: () {
                            viewModel.logIn(userNameController.text,
                                passwordController.text);
                          }),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
