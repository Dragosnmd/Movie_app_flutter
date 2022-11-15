// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../login/get_account_id.dart' as _i11;
import '../login/get_request_token_api.dart' as _i5;
import '../login/login_api_request.dart' as _i6;
import '../login/login_repository.dart' as _i12;
import '../login/session_token_api.dart' as _i9;
import '../movies/data/movie_api.dart' as _i7;
import '../movies/data/movie_repository.dart' as _i14;
import '../movies/presentation/login_view_model.dart' as _i13;
import '../movies/presentation/movies_view_model.dart' as _i15;
import '../networking/networking.dart' as _i17;
import '../storage_module/app_database/app_database.dart' as _i3;
import '../storage_module/movie_dao.dart' as _i8;
import '../storage_module/storage_module.dart'
    as _i16; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final storageModule = _$StorageModule();
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.AppDatabase>(() => storageModule.database);
  gh.lazySingleton<_i4.Dio>(() => networkModule.dio);
  gh.lazySingleton<_i5.GetRequestTokenApi>(
      () => _i5.GetRequestTokenApi(get<_i4.Dio>()));
  gh.lazySingleton<_i6.LoginApi>(() => _i6.LoginApi(get<_i4.Dio>()));
  gh.lazySingleton<_i7.MoviesApi>(() => _i7.MoviesApi(get<_i4.Dio>()));
  gh.lazySingleton<_i8.MoviesDao>(() => _i8.MoviesDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i9.SessionTokenApi>(
      () => _i9.SessionTokenApi(get<_i4.Dio>()));
  await gh.factoryAsync<_i10.SharedPreferences>(
    () => storageModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i11.AccountIdApi>(() => _i11.AccountIdApi(get<_i4.Dio>()));
  gh.lazySingleton<_i12.LoginRepository>(() => _i12.LoginRepository(
        get<_i6.LoginApi>(),
        get<_i5.GetRequestTokenApi>(),
        get<_i9.SessionTokenApi>(),
        get<_i10.SharedPreferences>(),
      ));
  gh.factory<_i13.LoginViewModel>(
      () => _i13.LoginViewModel(get<_i12.LoginRepository>()));
  gh.lazySingleton<_i14.MovieRepository>(() => _i14.MovieRepository(
        get<_i8.MoviesDao>(),
        get<_i7.MoviesApi>(),
      ));
  gh.factory<_i15.MoviesViewModel>(
      () => _i15.MoviesViewModel(get<_i14.MovieRepository>()));
  return get;
}

class _$StorageModule extends _i16.StorageModule {}

class _$NetworkModule extends _i17.NetworkModule {}
