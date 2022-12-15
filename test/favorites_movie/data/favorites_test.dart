import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/core/injection.dart';
import 'package:movie_app/movie/presentation/movie_details_view_model.dart';
import '../../core/injection.dart';
import '../../utils/test_mobx.dart';

void main() {
  setUpAll(() async {
    await TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(() async {
    await configureTestDependencies();
  });

  tearDown(() async {
    await getIt.reset();
  });
  test('Add and remove frome favorite', () async {
    final viewModel = getIt<MovieDetailsViewModel>(param1:436270);

    streamOf((_) => viewModel.isFavorite);

    expect(viewModel.isFavorite, false);

    await viewModel.toggleFavorite();

    await Future.delayed(Duration(milliseconds: 10));

    expect(viewModel.isFavorite, true);
  });
}
