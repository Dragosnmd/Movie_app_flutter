import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/data/token_request.dart';
import 'package:movie_app/networking/networking.dart';

@lazySingleton
class AccountIdApi {
  final Dio dio;
  // final NetworkModule networkModule;
  AccountIdApi(this.dio);

  Future<TokenRequest> accountId(String sessionId) async {
    try {
      final response = await dio.get(
        'account',
      );
      return TokenRequest.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response?.statusCode == 401 || ex.response?.statusCode == 404) {
        throw ex.response?.data['status_message'];
      }
      rethrow;
    }
  }
}
