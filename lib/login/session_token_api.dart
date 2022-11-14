import 'package:dio/dio.dart';
import 'package:movie_app/data/session.dart';
import 'package:movie_app/data/session_request.dart';
import 'package:movie_app/networking/networking.dart';

class SessionTokenApi {
  final NetworkModule networkModule;
  SessionTokenApi(this.networkModule);

  Future<SessionReqeust> newSession(final SessionLoad load) async {
    try {
      final response = await networkModule.dio
          .post('/authentication/session/new', data: load.toJson());
      return SessionReqeust.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response?.statusCode == 401 || ex.response?.statusCode == 404) {
        throw ex.response?.data['status_message'];
      }
      rethrow;
    }
  }
}
