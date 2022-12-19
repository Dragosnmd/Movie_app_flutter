import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/core/injection.dart';
import 'package:movie_app/main.dart';

void main() {
  setUpAll(() async {
    final binding =
        await IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
  });

  setUp(() async {
    await configureDependencies();
  });

  tearDown(() async {
    await getIt.reset();
  });

  testWidgets('Testing LoginScreen', (tester) async {
    await tester.pumpWidget(const MyApp());
    final usernameField = find.ancestor(
      of: find.text('Email'),
      matching: find.byType(TextFormField),
    );
    await tester.enterText(usernameField, "dragosncs");
    await tester.pumpAndSettle(Duration(milliseconds: 20));
    final passwordField = find.ancestor(
      of: find.text('Password'),
      matching: find.byType(TextFormField),
    );
    await tester.enterText(passwordField, "kHziM@S8Cpynut7");

    await tester.pumpAndSettle(Duration(milliseconds: 20));
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle(Duration(seconds: 1));
    await Future.delayed(const Duration(seconds: 1));

    // await tester.tap(find.ancestor(
    //     of: find.byType(IconButton),
    //     matching: find.byIcon(Icons.favorite)));
    await tester.tap(find.byIcon(Icons.favorite_border).first);

    await tester.pumpAndSettle(const Duration(seconds: 5));
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pumpAndSettle(const Duration(seconds: 15));
  });
}
  // testWidgets('Testing movie List', (tester) async {
  //   await tester.pumpWidget(const MyApp());


  //   // for (var icon in listFinder) {
  //   //   await tester.tap(find.byIcon(Icons.favorite));
  //   //   await tester.pumpAndSettle(Duration(seconds: 1));
  //   // }

  //   await tester.tap(find.byIcon(Icons.favorite_border));
  //   await tester.tap(find.byIcon(Icons.favorite));
  //   await tester.pumpAndSettle(const Duration(seconds: 15));

  // final gesture = await tester
  //     .startGesture(Offset(300, 500)); //Position of the scrollview
  // await gesture.moveBy(Offset(-300, -50)); //How much to scroll by
  // await tester.pump();
  // });
  // await tester.fling(listFinder, const Offset(50, 0), 0);
  // await tester.pumpAndSettle();
  // await tester.fling(listFinder, const Offset(-50, 0), 0);
  //   await tester.pumpAndSettle()