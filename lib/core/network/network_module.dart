import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
}

const String _apiKey = 'f1b8b13e0f1c7935c17d5b9e5b4f24e5';

const String imageUrl = 'https://image.tmdb.org/t/p/';

final dioProvider = Provider((ref) => Dio(
      BaseOptions(baseUrl: 'https://api.themoviedb.org/3'),
    )..interceptors
          .add(InterceptorsWrapper(onRequest: (options, handler) async {
        return handler.next(options
          ..queryParameters = {
            ...options.queryParameters,
            'api_key': _apiKey,
          });
      })));
