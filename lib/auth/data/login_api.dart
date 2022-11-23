import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'login_payload.dart';
import 'token_request.dart';

@lazySingleton
class LoginApi {
  final Dio dio;
  // final NetworkModule networkModule;
  LoginApi(this.dio);
  Future<TokenRequest> login(final LoginPayload payload) async {
    try {
      final response = await dio.post(
          '/authentication/token/validate_with_login',
          data: payload.toJson());
      return TokenRequest.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response?.statusCode == 401 || ex.response?.statusCode == 404) {
        throw ex.response?.data['status_message'];
      }
      rethrow;
    }
  }
}
