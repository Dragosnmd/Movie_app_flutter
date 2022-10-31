import 'package:movie_app/data/login_payload.dart';
import 'package:movie_app/data/mobx/session.dart';
import 'package:movie_app/data/token_request.dart';

import 'package:movie_app/login/get_request_token_api.dart';
import 'package:movie_app/login/login_api_request.dart';
import 'package:movie_app/login/session_token_api.dart';

import 'package:movie_app/storage_module/storage_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

// const String test = 'test_1';
const String requestToken = 'requestToken';
const String expiresTokenAt = 'expiredTokenAt';
const String sesionToken = 'sesionToken';
const String expireSessionToken = 'expireSessionToken';
const String sessionId = 'sessionId';

class LoginRepository {
  final LoginApi loginApi = LoginApi();
  final GetRequestTokenApi getRequestTokenApi = GetRequestTokenApi();
  final SessionTokenApi newSessionToken = SessionTokenApi();
  final SharedPreferences sharedPreferences =
      StorageModule.getInstance().sharedPreferences;

  LoginRepository() {
    checkAuth();
  }

  Future<bool> login(String username, String password) async {
    try {
      final TokenRequest token = await getRequestTokenApi.getRequestToken();

      await sharedPreferences.setString(requestToken, token.value);
      await sharedPreferences.setString(
          expiresTokenAt, token.expiresAt.toIso8601String());

      final sesionToken = await loginApi.login(LoginPayload(
          username: username, password: password, requestToken: token.value));
      print(sesionToken.value);

      final session = await newSessionToken
          .newSession(SessionLoad(requestToken: sesionToken.value));
      print(session.value);

      return true;
    } catch (ex) {
      // print(ex);
      return false;
    }
  }

  Future<bool> checkAuth() async {
    final String? token = sharedPreferences.getString(requestToken);

    if (token == null) return false;

    final String? tokenExpiredString =
        sharedPreferences.getString(expiresTokenAt);

    if (tokenExpiredString == null) return false;

    final DateTime tokenExpiredDate = DateTime.parse(tokenExpiredString);
    final DateTime now = DateTime.now().toUtc();

    final Duration diff = tokenExpiredDate.difference(now);
    print(now);
    print(tokenExpiredDate);

    if (diff.inMilliseconds <= 0) {
      sharedPreferences.remove(requestToken);
      sharedPreferences.remove(tokenExpiredString);
      //ToDo also remove sesion token
      return false;
    }
    return true;
  }
}
