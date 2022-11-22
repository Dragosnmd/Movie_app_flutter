// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../auth/data/account_id_api.dart' as _i11;
import '../auth/data/get_request_token_api.dart' as _i5;
import '../auth/data/login_api.dart' as _i6;
import '../auth/data/login_repository.dart' as _i12;
import '../auth/presentation/login_view_model.dart' as _i13;
import '../movie/data/movie_api.dart' as _i7;
import '../movie/data/movie_dao.dart' as _i8;
import '../movie/data/movie_repository.dart' as _i14;
import '../movie/presentation/movie_details_view_model.dart' as _i16;
import '../movie/presentation/movies_view_model.dart' as _i15;
import '../user/data/session_token_api.dart' as _i9;
import 'network/network_module.dart' as _i18;
import 'storage/app_database.dart' as _i3;
import 'storage/storage_module.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

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
  await gh.singletonAsync<_i12.LoginRepository>(
    () => _i12.LoginRepository.create(
      get<_i6.LoginApi>(),
      get<_i5.GetRequestTokenApi>(),
      get<_i9.SessionTokenApi>(),
      get<_i10.SharedPreferences>(),
    ),
    preResolve: true,
  );
  gh.factory<_i13.LoginViewModel>(
      () => _i13.LoginViewModel(get<_i12.LoginRepository>()));
  gh.lazySingleton<_i14.MovieRepository>(() => _i14.MovieRepository(
        get<_i8.MoviesDao>(),
        get<_i7.MoviesApi>(),
      ));
  gh.factory<_i15.MoviesViewModel>(
      () => _i15.MoviesViewModel(get<_i14.MovieRepository>()));
  gh.factoryParam<_i16.MovieDetailsViewModel, int, dynamic>((
    movieId,
    _,
  ) =>
      _i16.MovieDetailsViewModel(
        get<_i14.MovieRepository>(),
        movieId,
      ));
  return get;
}

class _$StorageModule extends _i17.StorageModule {}

class _$NetworkModule extends _i18.NetworkModule {}