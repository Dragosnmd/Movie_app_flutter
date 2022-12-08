import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movie_app/favorites_movie/presentation/favorites.dart';
import 'package:movie_app/movie/domain/movie.dart';
import 'package:movie_app/movie/presentation/screens/movie_List_Page.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

void main() {

  group('Favorites Page Widget Tests', () {
    testWidgets('Test if home ListView shows up', (tester) async {
    //     final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
    //     as IntegrationTestWidgetsFlutterBinding;
    // binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;
      await tester.pumpWidget(MaterialApp(home: MovieListPage()));
      expect(find.byType(ListView), findsOneWidget);
    //Add to favorite
      await tester.tap(find.byIcon(Icons.favorite).first);
      await tester.pumpAndSettle(Duration(seconds: 2));
    //Remove from favorite
      await tester.tap(find.byIcon(Icons.favorite).first);
    });

    // testWidgets('Testing Remove Button', (tester) async {
    //   await tester.pumpWidget(const Favorites());
    //   await tester.pumpAndSettle();
    //   var totalItems = tester.widgetList(find.byIcon(Icons.close)).length;
    //   await tester.tap(find.byIcon(Icons.close).first);
    //   await tester.pumpAndSettle();
    //   expect(tester.widgetList(find.byIcon(Icons.close)).length,
    //       lessThan(totalItems));
    //   expect(find.text('Removed from favorites.'), findsOneWidget);
    // });
  });
}
