import 'package:dio/dio.dart';

class NetworkModule {
  NetworkModule() {
    _addInterceptors();
  }
  final Dio dio = Dio(
    BaseOptions(baseUrl: 'https://api.themoviedb.org/3'),
  );
  static const String _apiKey = 'f1b8b13e0f1c7935c17d5b9e5b4f24e5';

  void _addInterceptors() {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      return handler.next(options
        ..queryParameters = {
          'api_key': _apiKey,
        });
    }));
  }
}
