import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/data/session.dart';
import 'package:movie_app/data/token_request.dart';
import 'package:movie_app/login/get_request_token_api.dart';
import 'package:movie_app/login/login_api_request.dart';
import 'package:movie_app/login/login_payload.dart';
import 'package:movie_app/login/session_token_api.dart';
import 'package:movie_app/networking/networking.dart';
import 'package:movie_app/storage_module/storage_module.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_repository.g.dart';

class LoginRepository = _LoginRepository with _$LoginRepository;

const String requestToken = 'requestToken';
const String requestToke1 = 'requestToken1';

const String expiresTokenAt = 'expiredTokenAt';
const String expiresTokenAt1 = 'expiredTokenAt1';

const String sesionToken = 'sesionToken';
const String sesionToken1 = 'sesionToken1';

const String sessionId = 'sessionId';
const String sessionId1 = 'sessionId1';

abstract class _LoginRepository with Store {
  // _LoginRepository() {
  //   checkAuthentification();
  // }

  @observable
  bool loginSucceed = false;

  final LoginApi loginApi;
  final GetRequestTokenApi getRequestTokenApi;
  final SessionTokenApi newSessionToken;

  final SharedPreferences sharedPreferences =
      StorageModule.getInstance().sharedPreferences;

  final FlutterSecureStorage secureStorage =
      StorageModule.getInstance().secureStorage;

  _LoginRepository(
      this.loginApi, this.getRequestTokenApi, this.newSessionToken) {
    checkAuthentification();
  }

  Future<bool> login(String username, String password) async {
    try {
      final TokenRequest token = await getRequestTokenApi.getRequestToken();
      final sesionToken = await loginApi.login(LoginPayload(
          username: username, password: password, requestToken: token.value));
      final session = await newSessionToken
          .newSession(SessionLoad(requestToken: sesionToken.value));

      await sharedPreferences.setString(requestToken, token.value);
      await sharedPreferences.setString(
          expiresTokenAt, token.expiresAt.toIso8601String());
      await sharedPreferences.setString(sessionId, session.value);

      await secureStorage.write(key: requestToke1, value: token.value);
      await secureStorage.write(
          key: expiresTokenAt1, value: token.expiresAt.toIso8601String());
      await secureStorage.write(key: sessionId1, value: session.value);

      checkAuthentification();
      return true;
    } catch (ex) {
      return false;
    }
  }

  Future<bool> checkAuth1() async {
    final String? token = sharedPreferences.getString(requestToken);
    print(token);

    if (token == null) return false;

    final String? tokenExpiredString =
        sharedPreferences.getString(expiresTokenAt);

    if (tokenExpiredString == null) return false;

    final DateTime tokenExpiredDate = DateTime.parse(tokenExpiredString);
    final DateTime now = DateTime.now().toUtc();

    final Duration diff = tokenExpiredDate.difference(now);

    if (diff.inMilliseconds <= 0) {
      return false;
    }
    return true;
  }

  Future<bool> checkAuth2() async {
    final String? token2 = await secureStorage.read(key: requestToke1);

    if (token2 == null) return false;

    final String? tokenExpString =
        await secureStorage.read(key: expiresTokenAt1);

    if (tokenExpString == null) return false;

    final DateTime tokenExpDate1 = DateTime.parse(tokenExpString);
    final DateTime now1 = DateTime.now().toUtc();

    final Duration difference = tokenExpDate1.difference(now1);

    if (difference.inMilliseconds <= 0) {
      return false;
    }
    // isLoginWithSecure = true;
    return true;
  }

  Future<void> clearExpiredData() async {
    sharedPreferences.remove(requestToken);
    sharedPreferences.remove(expiresTokenAt);
    secureStorage.delete(key: requestToke1);
    secureStorage.delete(key: expiresTokenAt1);
  }

  Future<bool> checkAuthentification() async {
    final bool isLoggedIn = await checkAuth1();
    final bool isLoggedInSecured = await checkAuth2();
    if (isLoggedIn & isLoggedInSecured) {
      loginSucceed = true;
      return true;
    }
    clearExpiredData();
    return false;
  }
}
