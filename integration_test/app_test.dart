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
    await tester.pumpAndSettle(Duration(seconds: 1));
    final passwordField = find.ancestor(
      of: find.text('Password'),
      matching: find.byType(TextFormField),
    );
    await tester.enterText(passwordField, "kHziM@S8Cpynut7");
    // await tester.tap(find.text('Login'));
    // await tester.tap(find.text('Email'),warnIfMissed: false);
    await tester.pumpAndSettle(Duration(seconds: 1));
    // await tester.enterText(find.byElementType(TextFormField), 'dragosncs');
    // await tester.enterText(find.byElementType(TextFormField), 'kHziM@S8Cpynut7');
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle(Duration(seconds: 3));
    await Future.delayed(const Duration(seconds: 3));
  });

  // testWidgets('Testing movie List', (tester) async {
  //   await tester.pumpWidget(const MyApp());

  //   await tester.pumpAndSettle(const Duration(seconds: 5));
  //   await tester.pumpAndSettle(const Duration(seconds: 5));
  //   final listFinder = find.byType(ListView);
  //   for (var icon in listFinder) {
  //     await tester.tap(find.byIcon(Icons.favorite));
  //     await tester.pumpAndSettle(Duration(seconds: 1));
  //   }

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
}