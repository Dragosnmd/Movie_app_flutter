import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/injection.dart';
import 'injection.config.dart';

@injectableInit
Future<void> configureTestDependencies({Environment environment = test}) async => $initGetIt(getIt, environment: environment.name);