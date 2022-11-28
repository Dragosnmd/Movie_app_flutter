// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../auth/data/account_id_api.dart' as _i12;
import '../auth/data/get_request_token_api.dart' as _i5;
import '../auth/data/login_api.dart' as _i6;
import '../auth/data/login_repository.dart' as _i15;
import '../auth/presentation/login_view_model.dart' as _i16;
import '../favorites_movie/data/favorites_movie_dao.dart' as _i9;
import '../favorites_movie/data/favorites_movie_repository.dart' as _i13;
import '../favorites_movie/data/favorites_movie_view_model.dart' as _i14;
import '../movie/data/movie_api.dart' as _i7;
import '../movie/data/movie_dao.dart' as _i8;
import '../movie/data/movie_repository.dart' as _i17;
import '../movie/presentation/movie_details_view_model.dart' as _i19;
import '../movie/presentation/movies_view_model.dart' as _i18;
import '../user/data/session_token_api.dart' as _i10;
import 'network/network_module.dart' as _i21;
import 'storage/app_database.dart' as _i3;
import 'storage/storage_module.dart'
    as _i20; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i9.MoviesDao>(() => _i9.MoviesDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i10.SessionTokenApi>(
      () => _i10.SessionTokenApi(get<_i4.Dio>()));
  await gh.factoryAsync<_i11.SharedPreferences>(
    () => storageModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i12.AccountIdApi>(() => _i12.AccountIdApi(get<_i4.Dio>()));
  gh.lazySingleton<_i13.FavoritesMovieRepository>(
      () => _i13.FavoritesMovieRepository(get<_i9.MoviesDao>()));
  gh.factory<_i14.FavourtiesMovieViewModel>(() =>
      _i14.FavourtiesMovieViewModel(get<_i13.FavoritesMovieRepository>()));
  await gh.singletonAsync<_i15.LoginRepository>(
    () => _i15.LoginRepository.create(
      get<_i6.LoginApi>(),
      get<_i5.GetRequestTokenApi>(),
      get<_i10.SessionTokenApi>(),
      get<_i11.SharedPreferences>(),
    ),
    preResolve: true,
  );
  gh.factory<_i16.LoginViewModel>(
      () => _i16.LoginViewModel(get<_i15.LoginRepository>()));
  gh.lazySingleton<_i17.MovieRepository>(() => _i17.MovieRepository(
        get<_i8.MoviesDao>(),
        get<_i7.MoviesApi>(),
      ));
  gh.factory<_i18.MoviesViewModel>(() => _i18.MoviesViewModel(
        get<_i17.MovieRepository>(),
        get<_i13.FavoritesMovieRepository>(),
      ));
  gh.factoryParam<_i19.MovieDetailsViewModel, int, dynamic>((
    movieId,
    _,
  ) =>
      _i19.MovieDetailsViewModel(
        get<_i17.MovieRepository>(),
        movieId,
        get<_i13.FavoritesMovieRepository>(),
      ));
  return get;
}

class _$StorageModule extends _i20.StorageModule {}

class _$NetworkModule extends _i21.NetworkModule {}
