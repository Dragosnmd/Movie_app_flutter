import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'token_request.dart';

@lazySingleton
class GetRequestTokenApi {
  // final NetworkModule networkModule;
  final Dio dio;
  GetRequestTokenApi(this.dio);

  Future<TokenRequest> getRequestToken() async {
    try {
      final response = await dio.get('/authentication/token/new');
      return TokenRequest.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response?.statusCode == 401 || ex.response?.statusCode == 404) {
        throw ex.response?.data['status_message'];
      }
      rethrow;
    }
  }
}
final getRequestTokeApi = Provider((ref) => GetRequestTokenApi);
