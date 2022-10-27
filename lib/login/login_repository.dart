import 'package:movie_app/data/login_payload.dart';
import 'package:movie_app/login/get_request_token_api.dart';
import 'package:movie_app/login/login_api_request.dart';
import 'package:movie_app/storage_module/storage_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String test = 'test_1';
const String requestToken = 'requestToken';
const String expiresTokenAt = 'expiredTokenAt';
const String sesionToken = 'sesionToken';
const String expireSessionToken = 'expireSessionToken';

class LoginRepository {
  final LoginApi loginApi = LoginApi();
  final GetRequestTokenApi getRequestTokenApi = GetRequestTokenApi();
  final SharedPreferences sharedPreferences =
      StorageModule.getInstance().sharedPreferences;

  LoginRepository() {
    checkAuth();
  }

  Future<bool> login(String username, String password) async {
    final token = await getRequestTokenApi.getRequestToken();
    final requestToken = token.value;
    final expiresTokenAt = token.expiresAt;
    print(expiresTokenAt);
    print(requestToken);
    final sesionToken = await loginApi.login(LoginPayload(
        username: username, password: password, requestToken: token.value));
    print(sesionToken);
    return true;
  }

  Future<void> checkAuth() async {
    final result = sharedPreferences.getString(test);
    final result1 = sharedPreferences.getString(requestToken);
    final date = DateTime.now();
    // print(date);
    print(result1);
    // final checkDuration = date.difference(result1);

    // print(result);
    await sharedPreferences.setString(test, '123');
    await sharedPreferences.setString(requestToken, 'requestToken');
  }
}
