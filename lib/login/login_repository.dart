import 'package:movie_app/data/login_payload.dart';
import 'package:movie_app/login/get_token_request_api.dart';
import 'package:movie_app/login/login_api.dart';

class LoginRepository {
  final LoginApi loginApi = LoginApi();
  final GetRequestTokenApi getRequestTokenApi = GetRequestTokenApi();

  Future<bool> login(String username, String password) async {
    final token = await getRequestTokenApi.getRequestToken();
    final sesionToken = await loginApi.login(LoginPayload(
        username: username, password: password, requestToken: token.value));
    return true;
  }
}
