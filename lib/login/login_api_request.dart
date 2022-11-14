import 'package:dio/dio.dart';
import 'package:movie_app/data/token_request.dart';
import 'package:movie_app/login/login_payload.dart';
import 'package:movie_app/networking/networking.dart';

class LoginApi {
  final NetworkModule networkModule;
  LoginApi(this.networkModule);
  Future<TokenRequest> login(final LoginPayload payload) async {
    try {
      final response = await networkModule.dio.post(
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
