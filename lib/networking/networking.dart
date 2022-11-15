import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(baseUrl: 'https://api.themoviedb.org/3'),
      )..interceptors
            .add(InterceptorsWrapper(onRequest: (options, handler) async {
          return handler.next(options
            ..queryParameters = {
              ...options.queryParameters,
              'api_key': _apiKey,
            });
        }));
  static const String _apiKey = 'f1b8b13e0f1c7935c17d5b9e5b4f24e5';
}
