// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../login/get_account_id.dart' as _i3;
import '../login/get_request_token_api.dart' as _i5;
import '../login/login_api_request.dart' as _i6;
import '../login/login_repository.dart' as _i11;
import '../login/session_token_api.dart' as _i10;
import '../movies/data/movie_api.dart' as _i7;
import '../movies/data/movie_repository.dart' as _i14;
import '../movies/presentation/login_view_model.dart' as _i13;
import '../movies/presentation/movies_view_model.dart' as _i15;
import '../networking/networking.dart' as _i4;
import '../storage_module/app_database/app_database.dart' as _i9;
import '../storage_module/movie_dao.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AccountIdApi>(
      () => _i3.AccountIdApi(get<_i4.NetworkModule>()));
  gh.factory<_i5.GetRequestTokenApi>(
      () => _i5.GetRequestTokenApi(get<_i4.NetworkModule>()));
  gh.factory<_i6.LoginApi>(() => _i6.LoginApi(get<_i4.NetworkModule>()));
  gh.singleton<_i7.MoviesApi>(_i7.MoviesApi(get<_i4.NetworkModule>()));
  gh.factory<_i8.MoviesDao>(() => _i8.MoviesDao(get<_i9.AppDatabase>()));
  gh.factory<_i10.SessionTokenApi>(
      () => _i10.SessionTokenApi(get<_i4.NetworkModule>()));
  gh.factory<_i11.LoginRepository>(() => _i11.LoginRepository(
        get<_i6.LoginApi>(),
        get<_i5.GetRequestTokenApi>(),
        get<_i10.SessionTokenApi>(),
        get<_i12.SharedPreferences>(),
      ));
  gh.factory<_i13.LoginViewModel>(
      () => _i13.LoginViewModel(get<_i11.LoginRepository>()));
  gh.factory<_i14.MovieRepository>(() => _i14.MovieRepository(
        get<_i8.MoviesDao>(),
        get<_i7.MoviesApi>(),
      ));
  gh.factory<_i15.MoviesViewModel>(
      () => _i15.MoviesViewModel(get<_i14.MovieRepository>()));
  return get;
}
