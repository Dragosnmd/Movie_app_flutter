import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies({Environment environment = dev}) async => $initGetIt(getIt, environment: environment.name);
